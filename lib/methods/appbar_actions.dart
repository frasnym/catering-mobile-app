import 'package:catering_app/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

List<Widget> appBarActions({Color color = Colors.white, BuildContext context}) {
  return [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        // TODO Search
      },
      color: color,
    ),
    IconButton(
      icon: Icon(Icons.shopping_cart_outlined),
      onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
      color: color,
    ),
    SizedBox(
      width: kDefaultPaddin / 2,
    )
  ];
}
