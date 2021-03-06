import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './src/providers/cart_provider.dart';
import './src/providers/datas_provider.dart';
import './src/screens/cart_screen.dart';
import './src/screens/category_store_screen.dart';
import './src/screens/login.dart';
import './src/screens/signup.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';
import './src/screens/store.dart';



void main() async {

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),

        ChangeNotifierProvider.value(
          value: Cart(),
        ),

        ChangeNotifierProvider.value(
          value: CategoriesProvider(),
        ),
      ],

        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'O\'Burger',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomePage(),

        routes: <String, WidgetBuilder> {
          SignUp.routeName: (BuildContext context) =>  SignUp(),
          Login.routeName: (BuildContext context) =>  Login(),
          Dashboard.routeName: (BuildContext context) => Dashboard(),
          ProductPage.routeName: (BuildContext context) => ProductPage(),
          CategoryStoreScreen.routeName: (BuildContext context) => CategoryStoreScreen(),
          CartScreen.routeName : (BuildContext context) => CartScreen(),
          Store.routeName: (BuildContext context) => Store(),
          
        },
      ),
    );
  }
}
