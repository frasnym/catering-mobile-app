import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

class FoodNote extends StatelessWidget {
  @override
  final Key? key;
  final Function updateFoodNote;
  final String initialText;

  const FoodNote({
    this.key,
    required this.updateFoodNote,
    required this.initialText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialText,
      onChanged: (text) => updateFoodNote(text),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kTextLightColor,
          ),
        ),
        prefixIcon: Icon(
          Icons.edit,
          color: Colors.black54,
        ),
        hintText: 'Note to modify food as You like :)',
        hintStyle: TextStyle(fontSize: 15.0, color: kTextLightColor),
      ),
      maxLines: 2,
    );
  }
}
