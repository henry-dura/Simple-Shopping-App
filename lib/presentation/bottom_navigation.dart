import 'package:flutter/material.dart';
import 'package:simple_shopping_app/presentation/product_page.dart';

import 'checkout_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black,fontSize: 18))

        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.pinkAccent.shade100,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.list,size: 40,),
              icon: Icon(Icons.list,size: 40,),
              label: 'Products',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart,size: 30,),
              label: 'Checkout',
            ),

          ],
        ),
      ),
      body: <Widget>[
        const ProductPage(),
        const CheckOutPage(),
      ][currentPageIndex],
    );
  }
}