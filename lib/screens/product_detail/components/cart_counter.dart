import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

class CartCounter extends StatelessWidget {
  @override
  final Key? key;

  const CartCounter({
    this.key,
    required this.minusItemCounter,
    required this.itemCounter,
    required this.plusItemCounter,
    required this.color,
  }) : super(key: key);

  final void Function() minusItemCounter;
  final void Function() plusItemCounter;
  final int itemCounter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSizedBox(minusItemCounter, Icons.remove),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: Text(
            itemCounter.toString().padLeft(2, "0"), //? Leading zero 2 digit
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        buildSizedBox(plusItemCounter, Icons.add),
      ],
    );
  }

  SizedBox buildSizedBox(void Function() press, IconData icon) {
    return SizedBox(
      height: 30,
      width: 40,
      child: ElevatedButton(
        onPressed: itemCounter == 1 && icon == Icons.remove ? null : press,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            foregroundColor: color),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
