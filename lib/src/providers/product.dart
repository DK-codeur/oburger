import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class Product with ChangeNotifier {
  String id;
  String name;
  int price;
  int demiPrice;
  String image;
  String isDemi;
  int discount;
  String cat;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.demiPrice,
    this.discount,
    @required this.image,
    @required this.isDemi,
    @required this.cat,
  });

}