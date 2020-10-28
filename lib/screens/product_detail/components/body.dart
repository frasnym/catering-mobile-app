import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';
import 'package:catering_app/screens/product_detail/components/product_title_image.dart';
import 'package:catering_app/screens/product_detail/components/taste_and_badge.dart';
import 'package:catering_app/screens/product_detail/components/description.dart';
import 'package:catering_app/screens/product_detail/components/counter_with_favorite.dart';
import 'package:catering_app/screens/product_detail/components/add_to_cart.dart';

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
                      TasteAndBadge(
                        product: product,
                      ),
                      Description(description: product.description),
                      CounterWithFavorite(),
                      AddToCart(product: product),
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
