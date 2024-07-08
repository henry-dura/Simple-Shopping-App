import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shopping_app/bloc/checkout_cubit.dart';
import '../bloc/products_bloc.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCubit checkOutCubit  = BlocProvider.of<CheckOutCubit>(context);
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Available Products',
            ),
          ),
          body: () {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadSuccessState) {
              final products = state.products.items;
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, left: 5, right: 5),
                                child: SizedBox(
                                  height: 220,
                                  width: double.infinity,
                                  child: Image.network(
                                    'https://api.timbu.cloud/images/${products[index].photos[0].url}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  right: -10,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.favorite,color: Colors.grey,))),
                            ]),
                            Text(
                              '${products[index].name}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '\u20A6${products[index].currentPrice[0].ngn[0]}',
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow.shade200,
                                      shape: const CircleBorder(),
                                    ),
                                    onPressed: () {
                                      checkOutCubit.addToCheckOut(products[index]);

                                    },
                                    child:
                                        const Icon(Icons.shopping_cart_rounded))
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              );
            } else if (state is ProductErrorState) {
              return Text(
                state.errorMessage,
                style: const TextStyle(),
              );
            } else {
              return const SizedBox();
            }
          }(),
        );
      },
    );
  }
}
