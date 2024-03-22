import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AddToCart extends StatelessWidget {
  @override
  final Key? key;
  final Product product;
  final Function addToCart;
  final int itemCounter;
  final String itemNote;

  const AddToCart({
    this.key,
    required this.product,
    required this.addToCart,
    required this.itemCounter,
    required this.itemNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = '';
    String order = '';
    int number = 1;
    int subTotal = 0;

    sendOrderInstant() async {
      url = 'https://wa.me/6281999200585?text=';
      order += "Hello, I want to order this item(s) below:\r\n";

      subTotal = itemCounter * product.price;
      order +=
          '$number. ${product.title} x$itemCounter: ${formatCurrency.format(subTotal)}\r\n';
      if (itemNote.isNotEmpty) {
        order += 'Item No. $number notes: $itemNote\r\n';
      }
      order += '\r\nTotal: ${formatCurrency.format(subTotal)}';
      order = Uri.encodeComponent(order);
      // print(url + order);

      if (await canLaunch(url + order)) {
        await launch(url + order);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: kDefaultPadding / 2,
            ),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: product.color,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: product.color,
              ),
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Added to cart!'),
                  duration: Duration(seconds: 2),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                // Scaffold.of(context).hideCurrentSnackBar();
                // Scaffold.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('Added to cart!'),
                //     duration: Duration(seconds: 2),
                //   ),
                // );
                addToCart(
                  product.id,
                  product.price,
                  product.title,
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton.icon(
                icon: SvgPicture.asset(
                  'assets/icons/whatsapp.svg',
                  width: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  'BUY NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: sendOrderInstant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
