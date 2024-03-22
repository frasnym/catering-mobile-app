import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/providers/products.dart';

class CartCounter extends StatelessWidget {
  @override
  final Key? key;
  final String cartId;
  final CartItem cartItem;

  const CartCounter({
    this.key,
    required this.cartId,
    required this.cartItem,
  }) : super(key: key);

  showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remove item"),
          content: const Text("Would you like to remove this item?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text(
                "Yes, Remove it!",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<Cart>(context, listen: false)
                    .removeSingleItem(cartId);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false)
        .findById(int.parse(cartId));

    return Row(
      children: [
        buildSizedBox(
          Icons.remove,
          cartItem.quantity == 1
              ? () => showAlertDialog(context)
              : () => Provider.of<Cart>(context, listen: false)
                  .removeQuantityItem(cartId),
          cartItem.quantity == 1 ? Colors.grey : product.color,
          cartItem.quantity,
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: Text((cartItem.quantity).toString().padLeft(2, "0")),
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
    void Function() press,
    Color color,
    int itemCounter,
  ) {
    return SizedBox(
      height: 35,
      width: 30,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          foregroundColor: color,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
