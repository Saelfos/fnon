import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Firebase/Components/Constants.dart';
import '../Firebase/Controllers/Upload_Controller.dart';
import 'Account_Widgets/rounded_button.dart';



class AddProductScreen extends StatelessWidget {
   AddProductScreen({Key key}) : super(key: key);
final UploadController uploadController=Get.put(UploadController());
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
              color: brightness == Brightness.light
                  ? Colors.black:Colors.white70),
          backgroundColor: brightness == Brightness.light
              ? Colors.white
              : Colors.grey.shade900,
          title: Text('Add product'.tr,
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
                    Obx(()=> uploadController.selectedImagePath.value==''? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height:130 ,
                        width:130 ,
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                                "Select Product Image".tr
                           ,style: TextStyle(fontSize: 22), ),
                          ),
                        ),
                      ),
                    ):


                    Padding(
                      padding: const EdgeInsets.only(top:50.0),
                      child: Container(
                          height: 160,
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),

                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.file(File(uploadController.selectedImagePath.value)

                              ),
                            ),
                          )

                      ),
                    )

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                          controller:foodController.name,
                          keyboardType: TextInputType.name,
                          cursorColor: Color.fromRGBO(222,167,0,1),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            hintText: "Product Name".tr,
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
                  controller:foodController.arabicName,
                  keyboardType: TextInputType.text,
                  cursorColor: Color.fromRGBO(222,167,0,1),
                  decoration: InputDecoration(
                    hintText: "Arabic Name".tr,
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    icon: Icon(Icons.fastfood_outlined,
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
                        controller:foodController.price,
                        keyboardType: TextInputType.number,
                        cursorColor: Color.fromRGBO(222,167,0,1),
                        decoration: InputDecoration(
                          hintText: "Price".tr,
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          icon: Icon(Icons.monetization_on_outlined,
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
                  controller:foodController.size,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  cursorColor: Color.fromRGBO(222,167,0,1),
                  decoration: InputDecoration(
                    hintText: "Size".tr,
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    icon: Icon(Icons.height,
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
                        controller:foodController.mainId,
                        keyboardType: TextInputType.number,

                        cursorColor: Color.fromRGBO(222,167,0,1),
                        decoration: InputDecoration(
                          hintText: "Home Page ID".tr,
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          icon: Icon(Icons.article_outlined,
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
                        controller:foodController.categoryId,
                        keyboardType: TextInputType.number,

                        cursorColor: Color.fromRGBO(222,167,0,1),
                        decoration: InputDecoration(
                          hintText: "Category ID".tr,
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          icon: Icon(Icons.article_outlined,
                              color: Color.fromRGBO(222,167,0,1)
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.only(top: 20),

                      child: RoundedButton(
                        icon: Icon(Icons.add),
                        color: Color.fromRGBO(222,167,0,1),
                        text: "Add Product".tr,secondColor: Colors.black,
                        onTap: () {
                          if(uploadController.selectedImagePath.value!=''
                              &&foodController.name.text.isNotEmpty&foodController.arabicName.text.isNotEmpty&
                          foodController.price.text.isNotEmpty&foodController.mainId.text.isNotEmpty&
                          foodController.categoryId.text.isNotEmpty&foodController.size.text.isNotEmpty){

                            uploadController.uploadImage();

                          }else{
                            ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar1));

                          }

                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RoundedButton(
                        icon: Icon(Icons.photo_size_select_actual_outlined),
                        color: Color.fromRGBO(222,167,0,1),
                        text: "Select Image".tr,secondColor: Colors.black,
                        onTap: () {
                          uploadController.pickImage();
                        },
                      ),
                    ),

                  ],


                ),
              ),

      )
    );

  }
}
