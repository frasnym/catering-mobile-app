import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/screens/cart/components/counter_with_subtotal.dart';
import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  @override
  final Key? key;
  final String cartId;
  final CartItem cartItem;
  final Product product;
  final int subTotal;

  const ItemDescription({
    this.key,
    required this.cartId,
    required this.product,
    required this.subTotal,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItem.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: kDefaultPadding / 4),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              product.subtitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: kTextLightColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          CounterWithSubtotal(
            cartId: cartId,
            cartItem: cartItem,
            subTotal: subTotal,
          )
        ],
      ),
    );
  }
}
