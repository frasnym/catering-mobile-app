import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/products.dart';

import 'package:catering_app/methods/appbar_actions.dart';

import 'package:catering_app/screens/product_detail/components/body.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as int; // is the id!

    final productData = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      backgroundColor: productData.color,
      appBar: AppBar(
        backgroundColor: productData.color,
        elevation: 0,
        actions: appBarActions(context: context),
      ),
      body: Body(product: productData),
    );
  }
}
