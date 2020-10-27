import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:catering_app/models/product.dart';

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
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              // width: 160,
              // height: 180,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: '${product.id}',
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/cutlery_placeholder.png'),
                  image: NetworkImage(product.imageUrl),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPaddin / 4,
            ),
            child: Text(
              product.title,
              style: const TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text(
            // '${product.price}',
            '${formatCurrency.format(product.price)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
