import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:catering_app/providers/cart.dart';
import 'package:catering_app/constants.dart';

class GrandTotalCheckout extends StatelessWidget {
  const GrandTotalCheckout({
    Key key,
    @required this.screenSize,
    @required this.cart,
  }) : super(key: key);

  final Size screenSize;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    String url = '';
    String order = '';
    int number = 1;
    int subTotal = 0;

    sendOrder() async {
      url = 'https://wa.me/6281999200585?text=';
      order += "Hello, I want to order this item(s) below:\r\n";

      cart.items.values.forEach((cartItem) {
        subTotal = cartItem.quantity * cartItem.price;
        order +=
            '$number. ${cartItem.title} x${cartItem.quantity}: ${formatCurrency.format(subTotal)}\r\n';
        if (cartItem.note.length > 0) {
          order += 'Item No. $number notes: ${cartItem.note}\r\n';
        }
        number++;
      });
      order += '\r\nTotal: ${formatCurrency.format(cart.totalAmount)}';
      order = Uri.encodeComponent(order);
      // print(url + order);
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Positioned(
      bottom: 0,
      child: Container(
        width: screenSize.width,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPaddin,
          vertical: kDefaultPaddin / 2,
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
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 15,
                        color: kTextLightColor,
                      ),
                ),
                Text(
                  '${formatCurrency.format(cart.totalAmount)}',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            RaisedButton.icon(
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
              color: Colors.red[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultPaddin / 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
