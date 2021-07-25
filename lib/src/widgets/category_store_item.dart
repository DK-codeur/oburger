import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/productPage.dart';
import '../shared/styles.dart';

class CategoryStoreItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // final categoryId = ModalRoute.of(context).settings.arguments as int;
    final reqCatItem  = Provider.of<Product>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
            ProductPage.routeName,
            arguments: reqCatItem.id
          );
      },

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.asset(
                    reqCatItem.image,
                    height: 220.0,
                    width: double.infinity,
                    fit: BoxFit.fill
                  ),
                ),

                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: 250.0,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 20.0
                    ),

                    child: Text(
                      reqCatItem.name,
                      style: TextStyle(fontSize: 24.0, color: Colors.white,),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: (reqCatItem.demiPrice != 0) ? MainAxisAlignment.spaceAround: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text( (reqCatItem.demiPrice != 0) ? 'Plat' : '', style: h6,),
                      Text('${reqCatItem.price.toInt()} F', style: h4),
                    ],
                  ),

                    (reqCatItem.demiPrice != 0) 
                  ?

                  Column(
                    children: <Widget>[
                      Text('1/2 Plat', style: h6),
                      Text('${reqCatItem.demiPrice.toInt()} F', style: h4),
                    ],
                  )

                  : 
                    SizedBox(width: 0,),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }


    // void selectFood(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   ProductPage.routeName,
    //   arguments: {
        // 'idItem': idcat, //id of food on cat
        
        // 'name': name,
        // 'isMenu': isMenu,
        // 'price': price,
        // 'image': image,
        // 'discount': discount
    //   }
    // );
  // }

}