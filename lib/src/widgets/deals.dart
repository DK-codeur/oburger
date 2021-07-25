import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/datas_provider.dart';
import '../widgets/fooditem.dart';
import './headerTopCategories.dart';

class Deals extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // var reqProd = foods.where( (prd) => prd.cat == widget.idCat).toList();
    final productsData = Provider.of<ProductsProvider>(context);
    final dealFood = productsData.foods;

    return Container(
    // margin: EdgeInsets.only(top: 5), 
      child: Column(
        children: <Widget>[

          Container(
            height: 145,
            child: HeaderTopCategories(),
          ),
          
          Expanded(
            // height: 330,
              child: GridView.builder(
              itemCount: dealFood.length,
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4.5/5,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0
              ),

              itemBuilder: (ctx, index) => ChangeNotifierProvider.value (
                value: dealFood[index],
                child: FoodItem(
                  //...id title 
                )
              ),
              
            ),
          ),
        ],
      ),
    );

        // Container(margin: EdgeInsets.only(bottom: 20),)

}

}