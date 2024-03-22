import 'package:flutter/material.dart';
import 'package:catering_app/constants.dart';

class Description extends StatelessWidget {
  @override
  final Key? key;
  final String description;

  const Description({
    this.key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
