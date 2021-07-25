import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../screens/productPage.dart';

class FoodItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Product>(context, listen: false);

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black12),
          boxShadow: [BoxShadow(
            offset: Offset(3, 5),
            color: Colors.black54,
            blurRadius: 5
          )]
        ),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: GridTile(
            child: GestureDetector(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: product.image,
                fit: BoxFit.cover,
              ),

              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductPage.routeName,
                  arguments: product.id
                );
              },
            ),

            footer: Container(
              height: 40,
              child: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.3,
                    color: Colors.orange
                  )

                ),

                subtitle: Text(
                  '${product.price.toString()} F',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 1.2,
                    color: Colors.white
                  ),
                ),

              ),
            ),
          ),
      ),
    );




  } //build


  // void selectFood(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   ProductPage.routeName,
    //   arguments: {
    //     'idItem': idItem,
        // 'name': name,
        // 'isMenu': isMenu,
        // 'price': price,
        // 'image': image,
        // 'discount': discount
      // }
    // );


  }
  



