import 'package:catering_app/models/product.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/providers/products.dart';
import 'package:catering_app/screens/cart/components/item_description.dart';
import 'package:catering_app/screens/cart/components/item_image.dart';
import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    Product product;
    int subTotal;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kTextColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Shopping Cart',
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(kDefaultPaddin),
        child: ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            product = Provider.of<Products>(context, listen: false)
                .findById(int.parse(cart.items.keys.toList()[index]));
            subTotal = cart.items.values.toList()[index].quantity *
                cart.items.values.toList()[index].price;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemImage(product: product),
                ItemDescription(
                  cartId: cart.items.keys.toList()[index],
                  cartItem: cart.items.values.toList()[index],
                  product: product,
                  subTotal: subTotal,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
