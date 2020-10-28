import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

List<Widget> appBarActions({Color color = Colors.white}) {
  return [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
      color: color,
    ),
    IconButton(
      icon: Icon(Icons.shopping_cart_outlined),
      onPressed: () {},
      color: color,
    ),
    SizedBox(
      width: kDefaultPaddin / 2,
    )
  ];
}
