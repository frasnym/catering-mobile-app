import 'package:catering_app/constants.dart';
import 'package:flutter/material.dart';

import 'package:catering_app/methods/appbar_actions.dart';
import 'package:catering_app/screens/product_list/components/body.dart';

class ProductListScreen extends StatelessWidget {
  static const routeName = '/product-list';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: const NetworkImage('https://i.ibb.co/BCDXHSs/home-banner-1.jpg'),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstIn),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: kTextColor,
          ),
          title: Text(
            "Foods",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: appBarActions(color: kTextColor),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Body(),
      ),
    );
  }
}
