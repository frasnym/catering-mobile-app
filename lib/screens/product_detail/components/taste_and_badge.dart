import 'package:flutter/material.dart';

import 'package:catering_app/models/product.dart';

import 'package:catering_app/constants.dart';

class TasteAndBadge extends StatelessWidget {
  @override
  final Key? key;
  final Product product;

  const TasteAndBadge({
    this.key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expanded(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Spiciness",
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //       Row(
        //         children: [
        //           Expanded(
        //             child: ColorDot(
        //               color: Color(0XFFFF9999),
        //               text: 'Normal',
        //               isSelected: true,
        //             ),
        //           ),
        //           Expanded(
        //             child: ColorDot(
        //               color: Color(0XFFB20000),
        //               text: 'Mild',
        //             ),
        //           ),
        //           Expanded(
        //             child: ColorDot(
        //               color: Color(0XFF4C0000),
        //               text: 'Spicy',
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        if (product.isBestSeller)
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Best Seller',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: kDefaultPadding / 4),
                Icon(
                  Icons.thumb_up,
                  color: product.color,
                ),
              ],
            ),
          ),
        if (product.isRecommended)
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Recommended',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: kDefaultPadding / 4),
                Icon(
                  Icons.thumb_up,
                  color: product.color,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  @override
  final Key? key;
  final Color color;
  final String text;
  final bool isSelected;

  const ColorDot({
    this.key,
    required this.color,
    this.isSelected = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPadding / 4,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2.5),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              border:
                  Border.all(color: isSelected ? color : Colors.transparent),
              shape: BoxShape.circle,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: null,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
