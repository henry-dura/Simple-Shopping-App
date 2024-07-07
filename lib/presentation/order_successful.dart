import 'package:flutter/material.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Order Successful'),),
        body: const Center(
            child: Text(
          'CONGRATULATIONS, ORDER SUCCESSFUL!!',
          style: TextStyle(fontSize: 35, color: Colors.white),
              textAlign: TextAlign.center,
        )));
  }
}
