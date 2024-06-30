import 'package:flutter/material.dart';
import 'package:simple_shopping_app/checkout_page.dart';
import 'package:simple_shopping_app/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black,fontSize: 18))
          // MaterialStateProperty.resolveWith<TextStyle>(
          //       (Set<MaterialState> states) => states.contains(MaterialState.selected)
          //       ? const TextStyle(color: Colors.white,fontSize: 18)
          //       : const TextStyle(color: Colors.black),
          // ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,

          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.pinkAccent,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.list,size: 40,),
              icon: Icon(Icons.list,size: 40,),
              label: 'Home',
              tooltip: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart,size: 40,),
              label: 'Business',
              tooltip: 'Business',
            ),

          ],
        ),
      ),
      body: <Widget>[
        ProductPage(),
        CheckOut(),
      ][currentPageIndex],
    );
  }
}