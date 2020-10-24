import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  var itemCounter = 1;

  void plusItemCounter() {
    setState(() {
      itemCounter++;
    });
  }

  void minusItemCounter() {
    if (itemCounter > 1) {
      setState(() {
        itemCounter--;
      });
    }
    return;
  }

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
