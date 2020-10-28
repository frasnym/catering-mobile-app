import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/products.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/screens/product_list/components/categories.dart';
import 'package:catering_app/screens/product_list/components/item_card.dart';
import 'package:catering_app/screens/product_detail/product_detail_screen.dart';

class Body extends StatefulWidget {
  final categoryId = 1;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _subCategoryId = 1;

  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<Products>(context, listen: false)
        .findByContainSubCatetogyId(_subCategoryId);

    void changeSubCategory(int selectedSubCategoryId) {
      setState(() {
        _subCategoryId = selectedSubCategoryId;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPaddin / 2,
          ),
          child: Categories(
            categoryId: widget.categoryId,
            changeSubCategory: changeSubCategory,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: _products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: _products[index],
                press: () => Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: _products[index].id,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
