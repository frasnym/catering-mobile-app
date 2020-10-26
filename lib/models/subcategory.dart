import 'package:flutter/material.dart';

class Subcategory {
  final String title;
  final int id, category;

  Subcategory({
    @required this.id,
    @required this.title,
    @required this.category,
  });
}

// List<Subcategory> subcategories = [
//   Subcategory(
//     id: 1,
//     title: 'Rice',
//     category: 1,
//   ),
//   Subcategory(
//     id: 2,
//     title: 'Vegetable',
//     category: 1,
//   ),
//   Subcategory(
//     id: 3,
//     title: 'Chicken',
//     category: 1,
//   ),
//   Subcategory(
//     id: 4,
//     title: 'Fish',
//     category: 1,
//   ),
//   Subcategory(
//     id: 5,
//     title: 'Meat',
//     category: 1,
//   ),
// ];
