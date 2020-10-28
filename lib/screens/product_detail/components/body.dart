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
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.3),
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.05,
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
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kTextLightColor,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.edit,
                              color: Colors.black54,
                            ),
                            hintText: 'Note to modify food as You like :)',
                            hintStyle: const TextStyle(
                                fontSize: 15.0, color: kTextLightColor),
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: kDefaultPaddin),
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
      ),
    );
  }
}
