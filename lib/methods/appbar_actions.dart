import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

List<Widget> appBarActions() {
  return [
    IconButton(icon: Icon(Icons.search), onPressed: null),
    IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: null),
    SizedBox(
      width: kDefaultPaddin / 2,
    )
  ];
}
