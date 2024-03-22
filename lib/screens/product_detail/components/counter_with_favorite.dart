import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

import 'package:catering_app/screens/product_detail/components/cart_counter.dart';

class CounterWithFavorite extends StatelessWidget {
  @override
  final Key? key;
  final void Function() minusItemCounter;
  final void Function() plusItemCounter;
  final int itemCounter;
  final Color color;

  const CounterWithFavorite({
    this.key,
    required this.minusItemCounter,
    required this.plusItemCounter,
    required this.itemCounter,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(
          minusItemCounter: minusItemCounter,
          itemCounter: itemCounter,
          plusItemCounter: plusItemCounter,
          color: color,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding / 4),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
