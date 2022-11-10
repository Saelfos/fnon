import 'dart:io';


import 'package:flutter/material.dart';
import 'package:fnon/Pages/shopping_cart_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../Firebase/Components/Constants.dart';
import '../Firebase/Controllers/Food_Controller.dart';
import 'Account_Widgets/rounded_button.dart';



class AddOrderScreen extends StatelessWidget {
  AddOrderScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: brightness == Brightness.light
                ? Colors.black:Colors.white70),
        backgroundColor: brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        title: Text('Add Order'.tr,
          style: TextStyle(
              color:brightness == Brightness.light
                  ? Colors.black:Colors.white70),
        ),
      ),
      backgroundColor:  brightness == Brightness.light
          ? Colors.white
          : Colors.grey.shade900,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 38),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255,235,175,1),

                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller:foodController.clientName,
                  keyboardType: TextInputType.name,
                  cursorColor: Color.fromRGBO(222,167,0,1),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    hintText: "Your Name".tr,
                    icon: Icon(Icons.drive_file_rename_outline,
                        color: Color.fromRGBO(222,167,0,1)
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ) ,
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255,235,175,1),

                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller:foodController.phoneNumber,
                keyboardType: TextInputType.phone,
                cursorColor: Color.fromRGBO(222,167,0,1),
                decoration: InputDecoration(
                  hintText: "Your Phone Number".tr,
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  icon: Icon(Icons.phone_outlined,
                      color: Color.fromRGBO(222,167,0,1)
                  ),
                  border: InputBorder.none,
                ),
              ),
            ) ,
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255,235,175,1),

                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller:foodController.location,
                keyboardType: TextInputType.text,
                cursorColor: Color.fromRGBO(222,167,0,1),
                decoration: InputDecoration(
                  hintText: "Your Address".tr,
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  icon: Icon(Icons.location_on_outlined,
                      color: Color.fromRGBO(222,167,0,1)
                  ),
                  border: InputBorder.none,
                ),
              ),
            ) ,
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255,235,175,1),

                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                controller:foodController.detailedLocation,
                keyboardType: TextInputType.text,
style: TextStyle(color: Colors.black),
                cursorColor: Color.fromRGBO(222,167,0,1),
                decoration: InputDecoration(
                  hintText: "Detailed Location".tr,
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  icon: Icon(Icons.location_on_outlined,
                      color: Color.fromRGBO(222,167,0,1)
                  ),
                  border: InputBorder.none,
                ),
              ),
            ) ,
            //Add Recipe Button
            Padding(
              padding: const EdgeInsets.only(top: 20),

              child: RoundedButton(
                width:size.width*0.8,
                height: size.height*0.075,
                icon: Icon(Icons.send_rounded),
                color: Color.fromRGBO(222,167,0,1),
                text: "Send Order".tr,secondColor: Colors.black,
                onTap: () {

                  if(foodController.clientName.text.isNotEmpty&foodController.phoneNumber.text.isNotEmpty&
                      foodController.location.text.isNotEmpty&foodController.detailedLocation.text.isNotEmpty){
                    GetStorage().write('clientName', foodController.clientName.text.toString());
                    foodController.addOrder(shoppingCartList);



                  }else{
                    ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar1));
                  }

                },
              ),
            ),
          ],
        ),
      ),

    );

  }
}
