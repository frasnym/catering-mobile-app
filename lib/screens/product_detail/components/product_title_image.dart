import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';

class ProductTitleImage extends StatelessWidget {
  ProductTitleImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  final formatCurrency =
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.subtitle,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: kDefaultPaddin * 2),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: 'Price\n'),
                  TextSpan(
                    text: '${formatCurrency.format(product.price)}',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ]),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
