import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: mediaQuerySize.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: mediaQuerySize.height * 0.3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  height: 500,
                ),
                Padding(
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
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(text: 'Price\n'),
                              TextSpan(
                                text: '${formatCurrency.format(product.price)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ]),
                          ),
                          SizedBox(width: kDefaultPaddin / 2),
                          Expanded(
                            child: Image.network(product.imageUrl),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Color')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
