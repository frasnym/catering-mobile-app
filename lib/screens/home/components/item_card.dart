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
    return Container(
      margin: const EdgeInsets.only(
        right: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 4),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              width: 100,
              height: 100,
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/images/cutlery_placeholder.png'),
                image: NetworkImage(product.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: kDefaultPadding / 4,
              left: kDefaultPadding / 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 10),
                ),
                Text(
                  formatCurrency.format(product.price),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
