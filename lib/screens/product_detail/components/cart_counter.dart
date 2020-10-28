import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key key,
    @required this.minusItemCounter,
    @required this.itemCounter,
    @required this.plusItemCounter,
    this.color,
  }) : super(key: key);

  final Function minusItemCounter;
  final int itemCounter;
  final Function plusItemCounter;
  final Color color;

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
      child: RaisedButton(
        onPressed: itemCounter == 1 && icon == Icons.remove ? null : press,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        color: color,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
