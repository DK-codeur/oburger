import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cart_provider.dart';


class OrderItem {
  final String id;
  final int amount;
  List<CartItem> products;
  final DateTime dateTime;
  final String image;
  final String foodType;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
    this.image,
    this.foodType,
  });

}

class Orders with ChangeNotifier {
  // List<OrderItem> _orders = [];

  // List<OrderItem> get orders {
  //   return [..._orders];
  // }

  
  Future<void> addOrder(List<CartItem> cartProducts, int total) async {
    const url = 'https://oburger2g3n.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        'products': cartProducts.map((cp) => {
          'id': cp.id,
          'title': cp.title,
          'quantity': cp.quantity,
          'price': cp.price,
          'isDemi': cp.isDemi,
          'image': cp.image,

        }).toList()
      })
    );

    //  _orders.insert(
    //   0, 
    //   OrderItem(
    //     id: json.decode(response.body)['name'],
    //     amount: total,
    //     dateTime: timeStamp,
    //     products: cartProducts,
    //   )
    // );

    notifyListeners();
  }


}

