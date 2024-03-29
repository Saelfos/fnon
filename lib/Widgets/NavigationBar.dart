import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fnon/Pages/Favorites_Screen.dart';
import 'package:fnon/Widgets/SearchBar.dart';
import 'package:fnon/Widgets/Settings.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Firebase/Components/Constants.dart';
import '../Firebase/Controllers/Food_Controller.dart';
import '../Pages/categories_screen.dart';
import '../Pages/client_order_screen.dart';
import '../Pages/header_and_body_screen.dart';
import '../Pages/orders_screen.dart';
import '../Pages/shopping_cart_screen.dart';


class Navigation extends StatefulWidget {
  Navigation({Key key}) : super(key: key);


  @override
  State<Navigation> createState() => _Navigation();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Navigation extends State<Navigation> {

  int _selectedIndex = 0;
  static List<Widget> _tabs = <Widget>[
    HomeScreenBody(),
    Sections(),
    aplicationID==2?ClientOrderScreen():OrdersScreen(),
    Favorites(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
FoodController foodController =Get.put(FoodController());
    var brightness = MediaQuery.of(context).platformBrightness;
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        brightness == Brightness.light ? light : dark);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         leadingWidth: 120,
          leading: Transform.scale(
              scale: size.aspectRatio*3.4,
              child: Image(image: AssetImage('assets/logo.png'),)),
          elevation: 0,
          backgroundColor:brightness == Brightness.light
              ? Colors.white
              : Colors.grey.shade900 ,
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: Search());
            }, icon:Icon(Icons.search),color:brightness == Brightness.light
                ? Colors.black
                : Colors.white70,),
            IconButton(onPressed: (){
              Get.to(ShoppingCart());
            },
                icon: Icon(Icons.shopping_cart_outlined),color:brightness == Brightness.light
                  ? Colors.black
                  : Colors.white70,),
            IconButton(onPressed: (){
              Get.to(SettingsPage());
            }, icon: Icon(Icons.settings),color:brightness == Brightness.light
                ? Colors.black
                : Colors.white70 ,)
          ],
        ),
        backgroundColor: brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
          body: Center(
              child: PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                fillColor: brightness == Brightness.light
                    ? Colors.white
                    : Colors.grey.shade900,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: _tabs[_selectedIndex],
          )
          ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: brightness == Brightness.light
              ? Colors.white
              : Colors.grey.shade900,
          type: BottomNavigationBarType.fixed,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps_outlined),
              activeIcon: Icon(Icons.apps),
              label: 'Categories'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wysiwyg_outlined),
              activeIcon: Icon(Icons.wysiwyg),
              label: 'Orders'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              activeIcon: Icon(Icons.favorite),
              label: 'Favorites'.tr,
            ),

          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(222,167,0,1),

          selectedLabelStyle:
              TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          unselectedFontSize: 15,
          unselectedItemColor: brightness == Brightness.light
              ? Colors.black87
              : Colors.white70,
          onTap: _onItemTapped,
        ),
      )
    );
  }
}
