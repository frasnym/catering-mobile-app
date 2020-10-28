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
      isRecomended: true,
      isBestSeller: false,
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
      isRecomended: false,
      isBestSeller: false,
    ),
    Product(
      id: 3,
      imageUrl: 'https://i.ibb.co/12KMy3q/3-fried-rice.png',
      title: 'Fried Rice',
      subtitle: 'Fried Rice Indonesian Style',
      price: 20000,
      description: 'Oishi Fried Rice Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFFC48742),
      subcategories: [
        1,
      ],
      isRecomended: false,
      isBestSeller: false,
    ),
    Product(
      id: 4,
      imageUrl: 'https://i.ibb.co/9VPzY7Q/4-fried-chicken-crispy.png',
      title: 'Fried Chicken Crispy',
      subtitle: 'Fried Chicken Crispy',
      price: 15000,
      description: 'Oishi Fried Chicken Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFFC97C1A),
      subcategories: [
        3,
      ],
      isRecomended: false,
      isBestSeller: false,
    ),
    Product(
      id: 5,
      imageUrl: 'https://i.ibb.co/y0cKkg7/5-fried-chicken.png',
      title: 'Fried Chicken',
      subtitle: 'Fried Chicken',
      price: 15000,
      description: 'Oishi Fried Chicken Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFF7E1804),
      subcategories: [
        3,
      ],
      isRecomended: false,
      isBestSeller: true,
    ),
    Product(
      id: 6,
      imageUrl: 'https://i.ibb.co/1svxsd9/6-beef-rendang.png',
      title: 'Beef Rendang',
      subtitle: 'Beef Rendang Padang',
      price: 55000,
      description: 'Oishi Beef Rendang Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFF9C5422),
      subcategories: [
        5,
      ],
      isRecomended: true,
      isBestSeller: true,
    ),
    Product(
      id: 7,
      imageUrl: 'https://i.ibb.co/0jgbbhc/7-fish-soup.png',
      title: 'Fish Soup',
      subtitle: 'Spicy Fish Soup',
      price: 60000,
      description: 'Oishi Fish Soup Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFFE29C39),
      subcategories: [
        4,
      ],
      isRecomended: true,
      isBestSeller: true,
    ),
    Product(
      id: 8,
      imageUrl: 'https://i.ibb.co/8z1mZCg/8-gado-gado.png',
      title: 'Gado Gado',
      subtitle: 'Indonesian Gado Gado with Peanut Sauce',
      price: 20000,
      description: 'Oishi Gado Gado Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFF448C3F),
      subcategories: [
        2,
      ],
      isRecomended: true,
      isBestSeller: true,
    ),
    Product(
      id: 9,
      imageUrl: 'https://i.ibb.co/9tLyNFZ/9-fried-fish.png',
      title: 'Fried Fish',
      subtitle: 'Fried Fish with Sambal',
      price: 60000,
      description: 'Oishi Fried Fish Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      color: Color(0XFFDA8B5B),
      subcategories: [
        4,
      ],
      isRecomended: false,
      isBestSeller: false,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> findPopularItem() {
    return _items.where((prod) => prod.isRecomended).toList();
  }

  List<Product> findByContainSubCatetogyId(int id) {
    return _items.where((prod) {
      return prod.subcategories.contains(id);
    }).toList();
  }
}
