import 'package:flutter/material.dart';
import 'package:oburger/src/providers/datas_provider.dart';
import 'package:provider/provider.dart';
import 'package:oburger/src/widgets/deals.dart';
// import '../widgets/headerTopCategories.dart';


class Store extends StatefulWidget {
  static const routeName = '/store';

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  

 @override
  void initState() {
    //Provider.of<ProductsProvider>(context).fetchAndSetProduct(); !!!!
    Future.delayed(Duration.zero).then((_) {
      Provider.of<ProductsProvider>(context).fetchAndSetProduct();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Deals()
    );


  }
}
