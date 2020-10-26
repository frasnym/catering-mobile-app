import 'package:flutter/material.dart';
import 'package:catering_app/constants.dart';

class TasteAndBadge extends StatelessWidget {
  final bool isRecomended;

  const TasteAndBadge({
    Key key,
    this.isRecomended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Spiciness",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: ColorDot(
                      color: Color(0XFFFF9999),
                      text: 'Normal',
                      isSelected: true,
                    ),
                  ),
                  Expanded(
                    child: ColorDot(
                      color: Color(0XFFB20000),
                      text: 'Mild',
                    ),
                  ),
                  Expanded(
                    child: ColorDot(
                      color: Color(0XFF4C0000),
                      text: 'Spicy',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (isRecomended)
          Expanded(
            child: Column(
              children: [
                Text(
                  'Recomended',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPaddin / 4),
                Icon(Icons.thumb_up),
              ],
            ),
          ),
        if (!isRecomended) Expanded(child: SizedBox(width: 1))
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSelected;

  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
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
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
