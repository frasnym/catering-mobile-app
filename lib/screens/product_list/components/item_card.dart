import 'package:flutter/material.dart';

import 'package:catering_app/models/product.dart';

import 'package:catering_app/constants.dart';

class ItemCard extends StatelessWidget {
  @override
  final Key? key;
  final Product product;
  final void Function() press;

  const ItemCard({
    this.key,
    required this.product,
    required this.press,
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
              padding: const EdgeInsets.all(kDefaultPadding),
              // width: 160,
              // height: 180,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: '${product.id}',
                child: FadeInImage(
                  placeholder:
                      const AssetImage('assets/images/cutlery_placeholder.png'),
                  image: NetworkImage(product.imageUrl),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 4,
            ),
            child: Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 12),
            ),
          ),
          Text(
            formatCurrency.format(product.price),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
