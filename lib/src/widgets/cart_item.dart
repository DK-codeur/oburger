import 'package:flutter/material.dart';
import 'package:oburger/src/shared/styles.dart';
// import '../models/cart_provider.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartItem extends StatelessWidget {

  final String id;
  final String productId;
  final String title;
  final int price;
  final int quantity;
  final String image;
  final String foodType;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title, this.image, this.foodType);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete, 
          color: Colors.white,
          size: 33,
        ),
      ),

      // confirmDismiss: (direction) {
      //   return showDialog(
      //     context: context,
      //     builder: (ctx) => AlertDialog(
      //       title: Text('Are you sure?'),
      //       content: Text('Do you want remove the item from the cart?'),
      //       actions: <Widget>[
      //         FlatButton(
      //           child: Text('No'),
      //           onPressed: () {
      //             Navigator.of(ctx).pop(false);
      //           },
      //         ),

      //         FlatButton(
      //           child: Text('Yes'),
      //           onPressed: () {
      //             Navigator.of(ctx).pop(true);
      //           },
      //         ),
      //       ],
      //     )
      //   );
      // },

      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },

      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 20),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Text(title, style: h6),
                Text('.', style: TextStyle(fontSize: 14)),
                Text('$foodType', style: TextStyle(color: Theme.of(context).accentColor))
              ],
            ),
            subtitle: Column(
              
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Prix U. : ${price.toInt()} F',),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Total : ${(price * quantity).toInt()} F'),
                  ],
                ),
              ],
            ),

            leading:  Container(
                width: 100,
                height: 100,
                child: Image.network(
                  image
                ),
            ),

            trailing: Text('x$quantity'),
          ),
        ),
      ),
    );
  }
}