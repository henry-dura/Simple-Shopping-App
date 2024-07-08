import 'package:flutter/material.dart';
import 'package:simple_shopping_app/data/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/checkout_cubit.dart';
import 'bloc/products_bloc.dart';
import 'presentation/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ProductsBloc(ProductRepository())
            ..add(ProductLoadEvent()),
        ),
        BlocProvider(
          create: (context) => CheckOutCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white30,
        ),
        home: const BottomNavPage(),
      ),
    );
  }
}
