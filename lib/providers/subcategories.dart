import 'package:flutter/material.dart';

import 'package:catering_app/models/subcategory.dart';

class Subcategories with ChangeNotifier {
  List<Subcategory> _items = [
    Subcategory(
      id: 1,
      title: 'Rice',
      category: 1,
    ),
    Subcategory(
      id: 2,
      title: 'Vegetable',
      category: 1,
    ),
    Subcategory(
      id: 3,
      title: 'Chicken',
      category: 1,
    ),
    Subcategory(
      id: 4,
      title: 'Fish',
      category: 1,
    ),
    Subcategory(
      id: 5,
      title: 'Meat',
      category: 1,
    ),
  ];

  List<Subcategory> get items {
    return [..._items];
  }

  Subcategory findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Subcategory> findByCategoryId(int categoryId) {
    return _items.where((prod) => prod.category == categoryId).toList();
  }
}
