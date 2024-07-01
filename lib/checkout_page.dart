import 'package:flutter/material.dart';
import 'package:simple_shopping_app/order_successful.dart';

import 'product_model.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});
  static List<ProductModel> cartedProducts = [];

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: CheckOut.cartedProducts.isEmpty
          ? const Center(
              child: Text(
              'Add Items for Checkout from Products page',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
            ))
          : ListView.builder(
              itemCount: CheckOut.cartedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                final product = CheckOut.cartedProducts[index];
                return Card(
                  child: ListTile(
                    leading: Container(
                      color: Colors.blueGrey,
                      height: 100,
                      width: 100,
                      child: Center(
                          child: Text(
                        product.image,
                        style: const TextStyle(fontSize: 20),
                      )),
                    ),
                    title: Text(
                      product.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      '\u20A6${product.price}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          CheckOut.cartedProducts.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(CheckOut.cartedProducts.isNotEmpty){
            setState(() {
              CheckOut.cartedProducts = [];
            });

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const OrderSuccess(),
              ),
            );
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No items added '),
                duration: Duration(milliseconds: 500 ),
              ),
            );
          }


        },
        child: const Text('Order'),
      ),
    );
  }
}
