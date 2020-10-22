import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:catering_app/models/Product.dart';

import 'package:catering_app/constants.dart';

class ItemCard extends StatelessWidget {
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  final Product product;
  final Function press;

  ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            // width: 160,
            // height: 180,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(product.imageUrl),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPaddin / 4,
          ),
          child: Text(
            product.title,
            style: TextStyle(
              color: kTextLightColor,
            ),
          ),
        ),
        Text(
          // '${product.price}',
          '${formatCurrency.format(product.price)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}