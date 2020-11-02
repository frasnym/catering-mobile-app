import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/screens/cart/components/counter_with_subtotal.dart';
import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    Key key,
    @required this.cartId,
    @required this.product,
    @required this.subTotal,
    @required this.cartItem,
  }) : super(key: key);

  final String cartId;
  final CartItem cartItem;
  final Product product;
  final int subTotal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItem.title,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: kDefaultPaddin / 4),
          Text(
            product.subtitle,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 16,
                  color: kTextLightColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
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
