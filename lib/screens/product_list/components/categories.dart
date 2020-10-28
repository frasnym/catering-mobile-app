import 'package:catering_app/models/subcategory.dart';
import 'package:catering_app/providers/subcategories.dart';
import 'package:flutter/material.dart';

import 'package:catering_app/constants.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  final Function changeSubCategory;
  final int categoryId;

  Categories({this.categoryId, this.changeSubCategory});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // By default first item will be selected
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Subcategory> subcategories = Provider.of<Subcategories>(
      context,
      listen: false,
    ).findByCategoryId(widget.categoryId);

    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subcategories.length,
          itemBuilder: (context, index) => buildCategory(
            index,
            subcategories[index],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(int index, Subcategory category) {
    return GestureDetector(
      onTap: () {
        widget.changeSubCategory(category.id);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color:
                  _selectedIndex == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
