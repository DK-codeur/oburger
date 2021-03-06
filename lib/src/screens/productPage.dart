import 'package:flutter/material.dart';
import 'package:oburger/src/providers/datas_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../providers/cart_provider.dart';
import '../widgets/badge.dart';
import '../shared/my_flutter_app_icons.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/buttons.dart';

import 'cart_screen.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/productPage';
  final String pageTitle;
 
  ProductPage({Key key, this.pageTitle,}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // double _rating = 4;
  int _quantity = 1;
  int menuSelected = 0;
  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context, listen: false);
    final foodId = ModalRoute.of(context).settings.arguments as String;
    // final foodId = routeArg['idItem'];
    //foods.firstWhere( (food) => food.idPdt == foodId);

    final reqPdt = Provider.of<ProductsProvider>(context).foodById(foodId);  

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 3,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text('COMMANDER', style: h4),

          actions: <Widget>[
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                value: cart.itemCount.toString(),
                child: ch,
              ),

              child: IconButton(
                icon: Icon(MyFlutterApp.shopping_bag, color: primaryColor,),
                iconSize: 27,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            )
          ],
        ),
        
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                      margin: EdgeInsets.only(top: 100, bottom: 40),
                      padding: EdgeInsets.only(top: 120, bottom: 50, right: 25, left: 25),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(reqPdt.name, style: h5),
                          
                          SizedBox(height: 20,),

                          (reqPdt.demiPrice != 0) 
                          ? //if reqPdt.menuPrice != 0

                          Container(

                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 14.0),
                                        child: Text(
                                        'Choisissez votre plat',
                                         style: TextStyle(color: Colors.grey[600]),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('Plat', style: h6, textAlign: TextAlign.left,),
                                        Text('${reqPdt.price.toInt()} F', style: h3a,) ,
                                        Radio(
                                          value: 0,
                                          groupValue: menuSelected,
                                          onChanged: menuSelect,
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: <Widget>[
                                        Text('1/2 Plat', style: h6, textAlign: TextAlign.right),
                                        Text('${reqPdt.demiPrice.toInt()} F', style: h3a,),
                                        Radio(
                                          value: 1,
                                          groupValue: menuSelected,
                                          onChanged: menuSelect,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )

                          )

                          : //else
                          Text('${reqPdt.price.toInt()} F', style: h3a,),

                          Container(child: Divider(),),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 20),
                            // child: SmoothStarRating(
                            //   allowHalfRating: false,
                            //   onRatingChanged: (v) {
                            //     setState(() {
                            //       _rating = v;
                            //     });
                            //   },
                            //   starCount: 5,
                            //   rating: _rating,
                            //   size: 27.0,
                            //   color: Colors.orange,
                            //   borderColor: Colors.orange,
                            // ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Quantit??', style: h6),
                                  margin: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                           if(_quantity == 1) return; //no decre if qte ==1
                                             _quantity -= 1; 
                                          });
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(left: 20, right: 20),
                                      child: Text(_quantity.toString(), style: h3), //print qte val
                                    ),

                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantity += 1;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ),

                                    
                                  ],
                                )
                              ],
                            ),
                          ),

                          Container(
                            width: 180,
                            child: froyoOutlineBtn(
                              'Acheter', 
                              () {
                              cart.addItem(
                                reqPdt.id, 
                               (reqPdt.demiPrice != 0 && (menuSelected == 1)) ? reqPdt.demiPrice : reqPdt.price,
                                reqPdt.name, 
                                reqPdt.image, 
                                (reqPdt.isDemi != '') ? reqPdt.isDemi : '',
                                _quantity,
                                
                              );

                              Navigator.of(context).pushNamed(
                                CartScreen.routeName
                              );

                               Fluttertoast.showToast(
                                msg: 'Veuillez valider votre panier',
                                toastLength: Toast.LENGTH_LONG, 
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: primaryColor,
                                textColor: Colors.white,
                                fontSize: 14.0
                              );
                            }),
                          ),

                          Container(
                            width: 180,
                            child: froyoFlatBtn(
                              'Ajouter au panier', 

                            () {
                              cart.addItem(
                                reqPdt.id, 
                                (reqPdt.demiPrice != 0 && (menuSelected == 1)) ? reqPdt.demiPrice  : reqPdt.price, 
                                reqPdt.name, 
                                reqPdt.image, 
                                (reqPdt.isDemi != '') ? reqPdt.isDemi : '',
                                _quantity
                              );

                              Navigator.pop(context);

                              Fluttertoast.showToast(
                                msg: 'Ajouter avec succ??s au panier',
                                toastLength: Toast.LENGTH_LONG, 
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: primaryColor,
                                textColor: Colors.white,
                                fontSize: 14.0
                              );
                              
                            }),
                          )

                        // trailing: IconButton(
                        //   icon: Icon(Icons.shopping_cart),
                        //   onPressed: () {
                        //     cart.addItem(product.id, product.price, product.title);
                        //   },
                        //   color: Theme.of(context).accentColor,
                        // ),


                        ],
                      ),

                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 5,
                                color: Color.fromRGBO(0, 0, 0, .05))
                          ]),
                    ),
                    ),
                    
                    //image
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 12.0,
                        child: SizedBox(
                          width: 240,
                          height: 200,
                          child: Image.network(
                            reqPdt.image,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  } //build

  void menuSelect(int value) {
    setState(() {
      menuSelected = value;
      switch(menuSelected) {
        case 0:
          Fluttertoast.showToast(
            msg: 'Plat selectionn?? !',
            toastLength: Toast.LENGTH_LONG, 
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 13.0
          );
          break;
        
        case 1:
          Fluttertoast.showToast(
            msg: '1/2 plat selectionn?? !',
            toastLength: Toast.LENGTH_LONG, 
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 13.0
          );
          break;
      
      }
    });
  }

}
