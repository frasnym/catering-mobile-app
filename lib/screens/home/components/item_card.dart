import 'package:flutter/material.dart';

import 'package:catering_app/models/product.dart';

import 'package:catering_app/constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: kDefaultPaddin / 2,
        bottom: kDefaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin / 4),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              width: 100,
              height: 100,
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/images/cutlery_placeholder.png'),
                image: NetworkImage(product.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: kDefaultPaddin / 4,
              left: kDefaultPaddin / 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 10),
                ),
                Text(
                  "${formatCurrency.format(product.price)}",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
