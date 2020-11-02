import 'package:flutter/foundation.dart';

class CartItem {
  final String id, title, note;
  final int quantity, price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.note,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get totalAmount {
    var total = 0;

    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  CartItem onCartCheck(String id) {
    if (_items.containsKey(id)) {
      return CartItem(
        id: _items[id].id,
        title: _items[id].title,
        price: _items[id].price,
        quantity: _items[id].quantity,
        note: _items[id].note,
      );
    }
    return CartItem(
      id: null,
      title: null,
      price: null,
      quantity: 1,
      note: '',
    );
  }

  void addItem(
    String productId,
    int price,
    String title,
    String note,
    int quantity,
  ) {
    if (_items.containsKey(productId)) {
      // ? change quantity if exist
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: quantity,
          note: note,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: quantity,
          note: note,
        ),
      );
    }
    print('id--${_items[productId].id}');
    print('title--${_items[productId].title}');
    print('note--${_items[productId].note}');
    print('quantity--${_items[productId].quantity}');
    print('price--${_items[productId].price}');
    notifyListeners();
  }

  void addQuantityItem(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          note: existingCartItem.note,
        ),
      );
      notifyListeners();
    }
  }

  void removeQuantityItem(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity > 1
              ? existingCartItem.quantity - 1
              : existingCartItem.quantity,
          note: existingCartItem.note,
        ),
      );
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity - 1,
          price: existingCartItem.price,
          note: existingCartItem.note,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
