import 'package:flutter/material.dart';
import 'package:catering_app/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
