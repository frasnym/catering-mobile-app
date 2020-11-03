import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';
import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/providers/products.dart';
import 'package:catering_app/screens/cart/components/item_description.dart';
import 'package:catering_app/screens/cart/components/item_image.dart';
import 'package:catering_app/screens/cart/components/grand_total_checkout.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Clear cart"),
          content: const Text("Would you like to remove all item?"),
          actions: [
            FlatButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: const Text(
                "Yes, Remove it!",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<Cart>(context, listen: false).clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed:
                  cart.itemCount == 0 ? null : () => showAlertDialog(context),
            ),
          ]),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: kDefaultPaddin / 2,
              right: kDefaultPaddin,
              left: kDefaultPaddin,
              bottom: kDefaultPaddin * 3,
            ),
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
          GrandTotalCheckout(screenSize: screenSize, cart: cart)
        ],
      ),
    );
  }
}
