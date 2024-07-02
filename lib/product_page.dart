import 'package:flutter/material.dart';
import 'package:simple_shopping_app/product_model.dart';
import 'data_table.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final List<ProductModel> products = List.generate(
    12,
    (index) => ProductModel(
      id: index,
      title: 'Product $index',
      image: 'image $index',
      price: 80.0 + index,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Products',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 2.2),
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.blueGrey,
                        child: Center(
                            child: Text(
                          product.image,
                          style: const TextStyle(fontSize: 30),
                        )),
                      ),
                      Text(
                        product.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\u20A6${product.price}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const CircleBorder(),
                            ),

                            onPressed: () {
                              CheckOutPage.checkedOutProducts.add(product);
                            },
                            child: const Icon(Icons.add)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}



