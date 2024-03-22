import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/products.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/screens/product_list/components/categories.dart';
import 'package:catering_app/screens/product_list/components/item_card.dart';
import 'package:catering_app/screens/product_detail/product_detail_screen.dart';

class Body extends StatefulWidget {
  final categoryId = 1;

  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _subCategoryId = 1;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false)
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
            vertical: kDefaultPadding / 2,
          ),
          child: Categories(widget.categoryId, changeSubCategory),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: products[index].id,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
