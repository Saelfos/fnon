import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fnon/Widgets/about_us.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Firebase/Components/Constants.dart';
import '../Pages/add_product_screen.dart';
import '../Pages/manage_products.dart';

class SettingsPage extends StatelessWidget {
   SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness= MediaQuery.of(context).platformBrightness;
    SystemChrome.setSystemUIOverlayStyle(
        brightness == Brightness.light ? light : dark);
    return Scaffold(
      backgroundColor:  brightness == Brightness.light
          ? Colors.white
          : Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: brightness == Brightness.light
                ? Colors.black
                :  Colors.white70),
        backgroundColor: brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        title: Text(
          'Settings'.tr,
          style: TextStyle(
              color: brightness == Brightness.light
                  ? Colors.black
                  :  Colors.white70),
        ),
      ),
      body: Column(

        children: [
          SizedBox(height: 10,),
          ListTile(
            leading:Icon(Icons.language_outlined,color: brightness == Brightness.light
                ?Colors.black
                :  Colors.white70,),
            title: Text('Language'.tr,style: TextStyle(color:brightness == Brightness.light
          ? Colors.black
          :  Colors.white70)),
            onTap:(){
              Get.to(Language());
            } ,
          ),
          SizedBox(height: 10,),
          Visibility(
            visible: aplicationID==1,
            child: ListTile(
              leading: Icon(Icons.add_circle_outline_rounded,color: brightness == Brightness.light
                  ?Colors.black
                  :  Colors.white70),
              title: Text('Add Product'.tr,style: TextStyle(color:brightness == Brightness.light
                  ? Colors.black
                  :  Colors.white70)),
              onTap:(){
                Get.to(AddProductScreen());
              } ,
            ),
          ) ,
          SizedBox(height: 10,),
          Visibility(
            visible: aplicationID==1,
            child: ListTile(
              leading: Icon(Icons.manage_accounts_outlined,color:brightness == Brightness.light
                  ?Colors.black
                  :  Colors.white70,),
              title: Text('Manage Products'.tr,style: TextStyle(color:brightness == Brightness.light
                  ? Colors.black
                  :  Colors.white70)),
              onTap:(){
                Get.to(()=> ManageProductsScreen());
              } ,
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.favorite_border_outlined,color:brightness == Brightness.light
                ?Colors.black
                :  Colors.white70,),
            title: Text('About'.tr,style: TextStyle(color:brightness == Brightness.light
                ? Colors.black
                :  Colors.white70)),
            onTap:(){
              Get.to(AboutScreen());
            } ,
          ),
        ],
      ),
    );
  }
}


class Language extends StatelessWidget {
   Language({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness= MediaQuery.of(context).platformBrightness;

    return Scaffold(
      backgroundColor:  brightness == Brightness.light
          ? Colors.white
          : Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: brightness == Brightness.light
                ?Colors.black
                :  Colors.white70),
        backgroundColor: brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        title: Text(
          'Language'.tr,
          style: TextStyle(
              color:brightness == Brightness.light
                  ?Colors.black
                  :  Colors.white70),
        ),
      ),
      body: Column(

        children: [
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.language_rounded,color: brightness == Brightness.light
                ?Colors.black
                :  Colors.white70),
            title: Text('English'.tr ,style: TextStyle(
      color: brightness == Brightness.light
          ?Colors.black
          :  Colors.white70),),
            onTap:(){
              Get.updateLocale(Locale('en','US'));
              GetStorage().write('language',1);
            } ,
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.language_rounded,color: brightness == Brightness.light
                ?Colors.black
                :  Colors.white70,),
            title: Text('Arabic'.tr, style: TextStyle(
                color: brightness == Brightness.light
                    ?Colors.black
                    :  Colors.white70),),
            onTap:(){
              Get.updateLocale(Locale('ar','SY'));
              GetStorage().write('language', 2);
            } ,
          )
        ],
      ),
    );
  }
}
