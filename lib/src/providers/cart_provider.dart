import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final int price;
  final String image;
  final String isDemi;

  CartItem({
    @required this.id, 
    @required this.title, 
    @required this.quantity, 
    @required this.price,
    @required this.image,
    this.isDemi,
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

  void addItem(String productId, int price, String title, String image, String isDemi, int qty,) {
   
    if (_items.containsKey(productId)) {
      _items.update(
        productId, 
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + qty, //maj
          image: existingCartItem.image,
          isDemi: existingCartItem.isDemi
        )
      );

    } else {
      _items.putIfAbsent(
        productId, 
        () => CartItem(
          id: productId, //date id 
          title: title, 
          price: price,
          quantity: qty,
          image: image,
        )
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }


} //Cart
