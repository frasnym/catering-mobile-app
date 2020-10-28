import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';

class FoodNote extends StatelessWidget {
  const FoodNote({
    Key key,
    this.updateFoodNote,
  }) : super(key: key);

  final Function updateFoodNote;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) => updateFoodNote(text),
      decoration: const InputDecoration(
        border: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: kTextLightColor,
          ),
        ),
        prefixIcon: const Icon(
          Icons.edit,
          color: Colors.black54,
        ),
        hintText: 'Note to modify food as You like :)',
        hintStyle: const TextStyle(fontSize: 15.0, color: kTextLightColor),
      ),
      maxLines: 2,
    );
  }
}
