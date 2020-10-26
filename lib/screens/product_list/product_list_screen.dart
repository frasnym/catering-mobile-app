import 'package:flutter/material.dart';

import 'package:catering_app/methods/appbar_actions.dart';
import 'package:catering_app/screens/product_list/components/body.dart';

class ProductListScreen extends StatelessWidget {
  static const routeName = '/product-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.brown,
      elevation: 0,
      actions: appBarActions(),
    );
  }
}
