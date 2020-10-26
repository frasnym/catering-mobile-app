import 'package:flutter/material.dart';

import 'package:catering_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 1,
      imageUrl: 'https://i.ibb.co/YchcSRN/1-chicken-salad.png',
      title: 'Chicken Salad',
      subtitle: 'Oriental Salad',
      price: 30000,
      description: 'Oishi Chicken Salad Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFFE3D4B7),
      subcategories: [
        3,
      ],
      isRecomended: true
    ),
    Product(
      id: 2,
      imageUrl: 'https://i.ibb.co/yhvhsLD/2-cap-cay.png',
      title: 'Cap Cay',
      subtitle: 'Oriental Salad',
      price: 50000,
      description: 'Oishi Cap Cay Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFF7E4327),
      subcategories: [
        2,
        3,
      ],
      isRecomended: false
    )
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> findByContainSubCatetogyId(int id) {
    return _items.where((prod) {
      return prod.subcategories.contains(id);
    }).toList();
  }
}
