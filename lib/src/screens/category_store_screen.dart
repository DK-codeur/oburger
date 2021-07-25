import 'package:flutter/material.dart';
import 'package:oburger/src/shared/colors.dart';
import 'package:oburger/src/widgets/category_store_item.dart';
import 'package:provider/provider.dart';

import '../providers/datas_provider.dart';


class CategoryStoreScreen extends StatelessWidget {
  static const routeName = '/categoryStore';

  @override
  Widget build(BuildContext context) {

    // final reqProdCategory = foods.where((prodcat) => prodcat.cat == categoryId).toList();
    final categoryId = ModalRoute.of(context).settings.arguments as String;
    final reqProdCategory = Provider.of<ProductsProvider>(context).foodsByCat(categoryId);
    final category = Provider.of<CategoriesProvider>(context).findById(categoryId);
    final categoryName = category.name;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: primaryColor,
      ),
      
      body: ListView.builder(
        itemCount: reqProdCategory.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: reqProdCategory[index],
          child: CategoryStoreItem(
            //all prop id, title...
          ),
        ),

      )
        // },
      // )
    );
  }
}