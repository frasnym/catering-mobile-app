import 'package:flutter/material.dart';

import 'package:catering_app/models/Product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 1,
      imageUrl: 'https://i.ibb.co/YchcSRN/1-chicken-salad.png',
      title: 'Chicken Salad',
      price: 30000,
      description: 'Oishi Chicken Salad',
      color: Color(0XFFE3D4B7),
    ),
    Product(
      id: 2,
      imageUrl: 'https://i.ibb.co/yhvhsLD/2-cap-cay.png',
      title: 'Cap Cay',
      price: 50000,
      description: 'Oishi Cap Cay',
      color: Color(0XFF7E4327),
    )
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
