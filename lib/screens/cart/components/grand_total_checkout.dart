import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/constants.dart';

class GrandTotalCheckout extends StatelessWidget {
  @override
  final Key? key;
  final Size screenSize;
  final Cart cart;

  const GrandTotalCheckout({
    this.key,
    required this.screenSize,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = '';
    String order = '';
    int number = 1;
    int subTotal = 0;

    sendOrder() async {
      url = 'https://wa.me/6281999200585?text=';
      order += "Hello, I want to order this item(s) below:\r\n";

      for (var cartItem in cart.items.values) {
        subTotal = cartItem.quantity * cartItem.price;
        order +=
            '$number. ${cartItem.title} x${cartItem.quantity}: ${formatCurrency.format(subTotal)}\r\n';
        if (cartItem.note.isNotEmpty) {
          order += 'Item No. $number notes: ${cartItem.note}\r\n';
        }
        number++;
      }
      order += '\r\nTotal: ${formatCurrency.format(cart.totalAmount)}';
      order = Uri.encodeComponent(order);
      // print(url + order);

      if (await canLaunch(url + order)) {
        await launch(url + order);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Positioned(
      bottom: 0,
      child: Container(
        width: screenSize.width,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        ),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: kTextLightColor,
            ),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grand Total',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                        color: kTextLightColor,
                      ),
                ),
                Text(
                  formatCurrency.format(cart.totalAmount),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: cart.itemCount == 0 ? null : sendOrder,
              icon: SvgPicture.asset(
                'assets/icons/whatsapp.svg',
                width: 20,
                color: Colors.white,
              ),
              label: const Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
