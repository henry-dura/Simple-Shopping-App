import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shopping_app/bloc/checkout_cubit.dart';
import 'package:simple_shopping_app/presentation/order_successful_page.dart';

const kTitleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const kPriceStyle = TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCubit checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    return BlocBuilder<CheckOutCubit, List<dynamic>>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('CheckOut'),
          ),
          body: state.isEmpty
              ? const Center(
                  child: Text(
                  'Add Products for Checkout',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = state[index];
                            return Card(
                              child: ListTile(
                                leading: Image.network(
                                  'https://api.timbu.cloud/images/${product.photos[0].url}',
                                  fit: BoxFit.fitHeight,
                                ),
                                title: Text(
                                  '${product.name}',
                                  style: kTitleStyle,
                                ),
                                subtitle: Text(
                                  '\u20A6${product.currentPrice[0].ngn[0]}',
                                  style: kPriceStyle,
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      checkOutCubit.removeFromCheckOut(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12), // Padding
                            textStyle: const TextStyle(fontSize: 18), // Text style
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const OrderSuccess(),
                              ),
                            );

                            checkOutCubit.clearCheckOut();
                          },
                          child: const Text(
                            'Place Order',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
        );
      },
    );
  }
}
