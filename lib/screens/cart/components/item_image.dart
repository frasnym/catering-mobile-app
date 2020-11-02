import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(kDefaultPaddin / 2),
      margin: const EdgeInsets.only(
        right: kDefaultPaddin / 2,
        bottom: kDefaultPaddin,
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
