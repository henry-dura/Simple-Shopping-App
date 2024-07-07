import 'package:flutter/material.dart';
import 'package:simple_shopping_app/presentation/order_successful.dart';
import 'package:simple_shopping_app/product_model.dart';


const kHeadingStyle=TextStyle(fontSize: 20,fontWeight: FontWeight.bold);

class CheckOutPage extends StatefulWidget {

  static List<ProductModel> checkedOutProducts =[];

  const CheckOutPage({super.key});




  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {





  double getTotalPrice() {
    return CheckOutPage.checkedOutProducts.fold(0.0, (currentTotal, product) => currentTotal + product.price);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('CheckOut'),),
      body: CheckOutPage.checkedOutProducts.isEmpty ?
      const Center(
          child: Text(
            'Add Items for Checkout from Products page',
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )):
      Column(
        children: [
          Expanded(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Products',style: kHeadingStyle,)),
                DataColumn(label: Text('Price',style: kHeadingStyle,)),
                DataColumn(label: Text('Action',style: kHeadingStyle,)),
              ],
              rows: CheckOutPage.checkedOutProducts.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item.title)),
                  DataCell(Text('\u20A6${item.price}')),
                  DataCell(IconButton(
                    icon: const Icon(Icons.delete,color: Colors.red,),
                    onPressed: () {
                      int index = CheckOutPage.checkedOutProducts.indexOf(item);
                    if(index != -1){
                      setState(() {
                        CheckOutPage.checkedOutProducts.removeAt(index);
                      });
                    }else{print('Index not found');}
                      // Remove item from checkout
                    },
                  )),
                ]);
              }).toList()
                ..add(DataRow(cells: [
                  const DataCell(Text('Total',style: kHeadingStyle)),
                  DataCell(Text('\u20A6${getTotalPrice()}',style: kHeadingStyle)),
                  const DataCell(Text('')),
                ])),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(

              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.black // Background color
            ),
            onPressed: () {
              if(CheckOutPage.checkedOutProducts.isNotEmpty){
                setState(() {
                  CheckOutPage.checkedOutProducts = [];
                });

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrderSuccess(),
                  ),
                );
              }
            },
            child: const Text('Place Order',style: TextStyle(fontSize: 18,color: Colors.white),),
          ),
        ],
      ) ,
    );
  }


}

