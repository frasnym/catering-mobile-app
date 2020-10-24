import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

List<Widget> appBarActions() {
  return [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
    IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
    SizedBox(
      width: kDefaultPaddin / 2,
    )
  ];
}
