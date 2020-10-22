import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/screens/product_list/components/body.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: null),
        IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: null),
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
