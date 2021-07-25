import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/datas_provider.dart';
import '../providers/category.dart';
import '../screens/category_store_screen.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';

class HeaderTopCategories extends StatelessWidget {
  
  Widget build(BuildContext context) {

  final categoryData = Provider.of<CategoriesProvider>(context);
  final categories = categoryData.categorie; //recup categorie de CategoriesProvider = all cat

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: Container(
          padding: EdgeInsets.only(top: 12.0, bottom: 4.0),
          color: Colors.white,
          width: double.infinity,
          child: Text(
            'Nos spécialités',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              fontFamily: 'CenturyGothic'
            ),
          ),
        ),
      ),
    
      SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,

          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: categories[index],
            child: HeaderCategoryItem(
              //all prop id, title...
            ),
          )
          ,
        ),
      ),

      // Container(child: Divider())
    ],
  );

  } }


// class header category item
class HeaderCategoryItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final category = Provider.of<Category>(context, listen: false);

    return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5),
            width: 60,
            height: 60,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: Text('${category.name}1'),

              onPressed: () {
                Navigator.of(context).pushNamed(
                CategoryStoreScreen.routeName,
                arguments: category.id
              );
              },
              backgroundColor: white,
              child: Image.asset(
                category.image,
                fit: BoxFit.fill,
                width: 65.0,
                height: 65.0,
              ),
            )),
        Text(category.name + ' ›', style: categoryText)
      ],
    ),
  );
  }

}