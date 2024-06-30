import 'package:flutter/material.dart';

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
      body: ListView.builder(
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
              title: Text(product.title,style: const TextStyle(fontSize: 20),),
              subtitle: Text(
                '\u20A6${product.price}',
                style: const TextStyle(fontSize: 18),
              ),
              trailing: IconButton(
                onPressed: (){
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
        onPressed: () {},
        child: const Text('Order'),
      ),
    );
  }
}
