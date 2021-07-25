import 'package:flutter/material.dart';
import 'package:oburger/src/providers/cart_provider.dart';
import 'package:oburger/src/screens/store.dart';
import 'package:oburger/src/shared/my_flutter_app_icons.dart';
import 'package:oburger/src/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../shared/main_drawer.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import 'cart_screen.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  // final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  int _selectedIndex = 1;
  Color iconCall = Colors.grey;
  Color iconAccount = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      Center(child: Text('Nos retso')),
      Store(),
      Center(child: Text('Profile')),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('O\' Burger', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                value: cart.itemCount.toString(),
                child: ch,
              ),

              child: IconButton(
                icon: Icon(MyFlutterApp.shopping_bag),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ) 
          ],
        ),

        body: _tabs[_selectedIndex],

        drawer: MainDrawer(),

        bottomNavigationBar: BottomAppBar(
          elevation: 12,
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.location_on, size: 27, color: iconCall),
              onPressed: () => _onItemTapped(0)
              
            ),

            SizedBox(width: 35,),

            IconButton(
              icon: Icon(Icons.account_circle, size: 27, color: iconAccount),
              onPressed: () => _onItemTapped(2)
            )
          ],
        ),
        ),

       floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _onItemTapped(1);
          });
        } ,
        child: Icon(Icons.home),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }

// void menuInfo() {
//     SnackBar mysnack = new SnackBar(
//       content: new Text(
//         'Mon premier snackbar'
//       ),
//       backgroundColor: Colors.red,
//       duration: new Duration(seconds: 2),
//     );

//     Scaffold.of(context).showSnackBar(mysnack);
// }
}

