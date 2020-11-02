import 'package:catering_app/constants.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:flutter/material.dart';

class CounterWithSubtotal extends StatelessWidget {
  const CounterWithSubtotal({
    Key key,
    @required this.cart,
    @required this.subTotal,
  }) : super(key: key);

  final CartItem cart;
  final int subTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 35,
              width: 30,
              child: RaisedButton(
                onPressed: null,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPaddin / 2),
              child: Text('${cart.quantity}'),
            ),
          ],
        ),
        Text(
          '${formatCurrency.format(subTotal)}',
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
