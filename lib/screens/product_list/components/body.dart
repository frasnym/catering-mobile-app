import 'package:flutter/material.dart';

import 'package:catering_app/models/Product.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/screens/product_list/components/categories.dart';
import 'package:catering_app/screens/product_list/components/item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPaddin,
            vertical: kDefaultPaddin / 2,
          ),
          child: Text(
            'Foods!',
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}