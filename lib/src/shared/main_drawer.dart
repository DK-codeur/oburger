import 'package:flutter/material.dart';

import '../screens/login.dart';

class MainDrawer extends StatelessWidget {

  // widget funct
  Widget menuList(String title, IconData icon, Function itemMenuTap) {
    return ListTile(
      leading: Icon(icon, size: 24,),
      title: Text(
        title, 
        style: TextStyle(
          fontFamily: 'CenturyGhotic',
          fontSize: 18,
          // fontWeight: FontWeight,
        ),
      ),
      onTap: () {
        itemMenuTap();
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  
                  height: 270,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40),
                  alignment: Alignment.bottomCenter,
                  // color: primaryColor,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/drawer oburger.jpg',
                      )
                    )
                  ),

                //   child: Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       fit: BoxFit.contain,
                //       image: AssetImage(
                //         'images/car.png'
                //       )
                //     )
                //   )
                // )
              
                ),

                // Positioned(
                //   bottom: 3,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(vertical: 5),
                //     child: Text(
                //         'Graya c\'est la base!',
                //         style: TextStyle(
                //           fontFamily: 'Pacifico',
                //           fontSize: 25,
                //           color: Colors.white,
                //         )
                //       ),
                //   ),
                // ),

                
              ],
            ),

            SizedBox(height: 20,),

            // DrawerCategorie(),
            menuList('Store', Icons.home,() => Navigator.of(context).pushNamed('Login.routeName')),
            menuList('Compte', Icons.account_circle,() => Navigator.of(context).pushNamed(Login.routeName)),
            menuList('Nos resto', Icons.location_on,() => Navigator.of(context).pushNamed("")),
            menuList('Aide', Icons.help_outline,() => Navigator.of(context).pushNamed("")),

            
          ],
        ),
      ),
    );
  }
}