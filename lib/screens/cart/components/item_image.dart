import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';

class ItemImage extends StatelessWidget {
  @override
  final Key? key;
  final Product product;

  const ItemImage({
    this.key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      margin: const EdgeInsets.only(
        right: kDefaultPadding / 2,
        bottom: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        color: product.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        product.imageUrl,
      ),
    );
  }
}
