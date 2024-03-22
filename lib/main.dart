import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/subcategories.dart';
import 'package:catering_app/providers/products.dart';
import 'package:catering_app/providers/cart.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/screens/home/home_screen.dart';
import 'package:catering_app/screens/product_list/product_list_screen.dart';
import 'package:catering_app/screens/product_detail/product_detail_screen.dart';
import 'package:catering_app/screens/cart/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Subcategories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          ProductListScreen.routeName: (ctx) => const ProductListScreen(),
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}
