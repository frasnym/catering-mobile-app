import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key key,
    @required this.minusItemCounter,
    @required this.itemCounter,
    @required this.plusItemCounter,
  }) : super(key: key);

  final Function minusItemCounter;
  final int itemCounter;
  final Function plusItemCounter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSizedBox(minusItemCounter, Icons.remove),
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin / 2),
          child: Text(
            itemCounter.toString().padLeft(2, "0"), //? Leading zero 2 digit
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildSizedBox(plusItemCounter, Icons.add),
      ],
    );
  }

  SizedBox buildSizedBox(Function press, IconData icon) {
    return SizedBox(
      height: 30,
      width: 40,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(icon),
        onPressed: press,
      ),
    );
  }
}
