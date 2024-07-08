import 'package:flutter/material.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Order'),),
        body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
                Text(
          'SUCCESSFUL!!',
          style: TextStyle(fontSize: 35, color: Colors.white),
                  textAlign: TextAlign.center,
        ),
              ],
            )));
  }
}
