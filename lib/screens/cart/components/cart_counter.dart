import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/providers/products.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key key,
    @required this.cartId,
    this.cartItem,
  }) : super(key: key);

  final String cartId;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false)
        .findById(int.parse(cartId));
    return Row(
      children: [
        buildSizedBox(
          Icons.remove,
          () => Provider.of<Cart>(context, listen: false)
              .removeQuantityItem(cartId),
          product.color,
          cartItem.quantity,
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin / 2),
          child: Text('${(cartItem.quantity).toString().padLeft(2, "0")}'),
        ),
        buildSizedBox(
          Icons.add,
          () =>
              Provider.of<Cart>(context, listen: false).addQuantityItem(cartId),
          product.color,
          cartItem.quantity,
        ),
      ],
    );
  }

  SizedBox buildSizedBox(
    IconData icon,
    Function press,
    Color color,
    int itemCounter,
  ) {
    return SizedBox(
      height: 35,
      width: 30,
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
