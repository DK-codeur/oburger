import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'category.dart';
import 'product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _foods = [
  //     Product(
  //       id: "1",
  //       name: "Burger",
  //       price: 25000,
  //       demiPrice: 0,
  //       isDemi: '',
  //       image: "images/burger.jpg",
  //       cat: "1",
  //       discount: 0.0,
  //     ),

  //   Product(
  //     id: "2",
  //     name: "Poulet Pane",
  //     price: 40000,
  //     demiPrice: 0,
  //     isDemi: '',
  //     image: "images/poule_pane.jpg",
  //     cat: "2",
  //     discount: 0.0,
  //   ),

  //   Product(
  //   id: "3",
  //   name: "Chawarma",
  //   image: "images/chawarma.jpg",
  //   price: 25000,
  //   demiPrice: 0,
  //   isDemi: '',
  //   cat: "3",
  //   discount: 0.0,
  // ),

  // Product(
  //   id: "4",
  //   name: "Dibi poulet",
  //   image: "images/dibi_poulet_ed.jpg",
  //   price: 85000,
  //   demiPrice: 50000,
  //   isDemi: '',
  //   cat: "2",
  //   discount: 0.0,
  // ), 

  // Product(
  //   id: "5",
  //   name: "Dibi viande",
  //   image: "images/dibi_viande_alloco.jpg",
  //   price: 60000,
  //   demiPrice: 0,
  //   isDemi: '',
  //   cat: "",
  //   discount: 0.0,
  // ),

  // Product(
  //   id: "6",
  //   name: "Poulet pays",
  //   image: "images/poule_pays.jpg",
  //   cat: "2",
  //   price: 80000,
  //   demiPrice: 45000,
  //   isDemi: 'Demi plat',
  //   discount: 0.0,
  // ),

  // Product(
  //   id: "7",
  //   name: "Lafidi",
  //   image: "images/lafidi.jpg",
  //   cat: "5",
  //   price: 20000,
  //   demiPrice: 0,
  //   isDemi: '',
  //   discount: 0.0,
  // ),

  // Product(
  //   id: "8",
  //   name: "Sandwich",
  //   image: "images/sandwich.jpg",
  //   cat: "4",
  //   price: 25000,
  //   demiPrice: 0,
  //   isDemi: '',
  //   discount: 0.0,
  // ),

  //  Product(
  //   id: "9",
  //   name: "Boulettes",
  //   image: "images/boulettes.jpg",
  //   cat: "6",
  //   price: 30000,
  //   demiPrice: 0,
  //   isDemi: '',
  //   discount: 0.0,
  // ),

];


  List<Product> get foods {
    
  return [..._foods];
 }


  Future<void> fetchAndSetProduct() async { 
    const url = 'https://oburger2g3n.firebaseio.com/products.json';
    
    try{
      final response = await  http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData.toString());
      if(extractedData == null) {
        return;
      }

      print(extractedData.toString());

      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(

          id: prodId,
          name: prodData['name'],
          price: prodData['price'],
          demiPrice: prodData['demiPrice'],
          image: prodData['image'],
          isDemi: prodData['isDemi'],
          discount: prodData['discount'],
          cat: prodData['cat'],

        ));
      }); 

      _foods = loadedProducts;
      notifyListeners();

    }catch (error) {
      throw (error);
    }

  }


  Product foodById(String id) {
    return _foods.firstWhere( (fd) => fd.id == id);
  }

  List<Product> foodsByCat(String cat) {
    return foods.where((fd) => fd.cat == cat).toList();
  }

} //ProductsProvider








  class CategoriesProvider with ChangeNotifier {

  List<Category> _categorie = [

  Category(
    id: '1',
    name: 'Burger',
    image: 'images/burgerCat.png',
  ),

  Category(
    id: '2',
    name: 'Poulet',
    image: 'images/chickenCat.png',
  ),

  Category(
    id: '3',
    name: 'Chawarma',
    image: 'images/chawarmaCat.png',
  ),



  Category(
    id: '4',
    name: 'Sandwich',
    image: 'images/sandwichCat.png',
  ),

  Category(
    id: '5',
    name: 'Lafidi',
    image: 'images/lafidiCat.png',
  ),



  Category(
    id: '6',
    name: 'Boulette',
    image: 'images/bouletteCat.png',
  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

  
];


 List<Category> get categorie {
    
  return [..._categorie];
 }

  
  // Future<void> fetchAndSetCategory() async {
  //   const url = '';

  //   try{
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;
  //     print(extractedData.toString());

  //     if (extractedData == null) {
  //       return;
  //     }

  //     final List<Category> loadedCategory = [];
  //     extractedData.forEach((catId, catData) {
  //       loadedCategory.add(Category(

  //         id: catId,
  //         name: catData['name'],
  //         image: catData['image']

  //       ));
  //     });

  //     _categorie = loadedCategory;
  //     notifyListeners();


  //   } catch (error) {
  //     throw (error);
  //   }

  // } 


  Category findById(String id) {
    return _categorie.firstWhere( (categ) => categ.id == id);
  }


}