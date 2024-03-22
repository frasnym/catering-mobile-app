import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/screens/cart/cart_screen.dart';

import 'package:provider/provider.dart';

List<Widget> appBarActions(Color color, BuildContext context) {
  final itemOnCart = Provider.of<Cart>(context).items.values.length;

  return [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        // TODO Search
      },
      color: color,
    ),
    Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () =>
              Navigator.of(context).pushNamed(CartScreen.routeName),
          color: color,
        ),
        itemOnCart > 0
            ? Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 3),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '$itemOnCart',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : const SizedBox(width: 0),
      ],
    ),
    const SizedBox(
      width: kDefaultPadding / 2,
    )
  ];
}
