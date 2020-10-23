import 'package:catering_app/constants.dart';
import 'package:flutter/material.dart';

import 'package:catering_app/models/product.dart';
import 'package:catering_app/screens/product_detail/components/product_title_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: mediaQuerySize.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: mediaQuerySize.height * 0.3),
                  padding: EdgeInsets.only(
                    top: mediaQuerySize.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spiciness",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Row(
                                children: [
                                  ColorDot(
                                    color: Color(0XFFFF9999),
                                    text: 'Normal',
                                  ),
                                  ColorDot(
                                    color: Color(0XFFB20000),
                                    text: 'Mild',
                                  ),
                                  ColorDot(
                                    color: Color(0XFF4C0000),
                                    text: 'Spicy',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ProductTitleImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSelected;

  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2.5),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              border: Border.all(color: color),
              shape: BoxShape.circle,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: null,
            ),
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
