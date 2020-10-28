import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

import 'package:catering_app/screens/product_detail/components/cart_counter.dart';

class CounterWithFavorite extends StatelessWidget {
  const CounterWithFavorite({
    Key key,
    this.minusItemCounter,
    this.plusItemCounter,
    this.itemCounter,
  }) : super(key: key);

  final Function minusItemCounter;
  final Function plusItemCounter;
  final int itemCounter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(
          minusItemCounter: minusItemCounter,
          itemCounter: itemCounter,
          plusItemCounter: plusItemCounter,
        ),
        DecoratedBox(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPaddin / 4),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 20,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
