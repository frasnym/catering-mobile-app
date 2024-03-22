import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';

class ProductTitleImage extends StatelessWidget {
  @override
  final Key? key;
  final Product product;

  const ProductTitleImage({
    this.key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.subtitle,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: kDefaultPadding),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  const TextSpan(text: 'Price\n'),
                  TextSpan(
                    text: formatCurrency.format(product.price),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ]),
              ),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: Hero(
                  tag: '${product.id}',
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
