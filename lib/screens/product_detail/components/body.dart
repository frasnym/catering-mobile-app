import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/cart.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/models/product.dart';

import 'package:catering_app/screens/product_detail/components/product_title_image.dart';
import 'package:catering_app/screens/product_detail/components/taste_and_badge.dart';
import 'package:catering_app/screens/product_detail/components/description.dart';
import 'package:catering_app/screens/product_detail/components/food_note.dart';
import 'package:catering_app/screens/product_detail/components/counter_with_favorite.dart';
import 'package:catering_app/screens/product_detail/components/add_to_cart.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _foodNote = '';
  var _itemCounter = 1;

  @override
  void initState() {
    super.initState();

    CartItem cartItem = Provider.of<Cart>(
      context,
      listen: false,
    ).onCartCheck('${widget.product.id}');

    _foodNote = cartItem.note;
    _itemCounter = cartItem.quantity;
  }

  void _updateFoodNote(text) {
    setState(() {
      _foodNote = text;
    });
    return;
  }

  void _plusItemCounter() {
    setState(() {
      _itemCounter++;
    });
    return;
  }

  void _minusItemCounter() {
    if (_itemCounter > 1) {
      setState(() {
        _itemCounter--;
      });
    }
    return;
  }

  void _addToCart(int productId, int price, String title) {
    FocusScope.of(context).requestFocus(FocusNode());
    Provider.of<Cart>(
      context,
      listen: false,
    ).addItem('$productId', price, title, _foodNote, _itemCounter);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.3),
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.05,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        TasteAndBadge(product: widget.product),
                        Description(description: widget.product.description),
                        FoodNote(
                          updateFoodNote: _updateFoodNote,
                          initialText: _foodNote,
                        ),
                        const SizedBox(height: kDefaultPaddin),
                        CounterWithFavorite(
                          itemCounter: _itemCounter,
                          minusItemCounter: _minusItemCounter,
                          plusItemCounter: _plusItemCounter,
                          color: widget.product.color,
                        ),
                        AddToCart(
                          product: widget.product,
                          addToCart: _addToCart,
                          itemCounter: _itemCounter,
                          itemNote: _foodNote,
                        ),
                      ],
                    ),
                  ),
                  ProductTitleImage(product: widget.product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
