

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fnon/Firebase/Controllers/Food_Controller.dart';
import 'package:fnon/Firebase/Controllers/Language_Controller.dart';
import 'package:fnon/Firebase/Controllers/Upload_Controller.dart';
import 'package:get/get.dart';


FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseStorage firebaseStorage =FirebaseStorage.instance;



FoodController foodController = Get.put(FoodController());
UploadController uploadController= Get.put(UploadController());
LanguageController languageController = Get.put(LanguageController());






  final light = SystemUiOverlayStyle(
      statusBarColor:
       Colors.white,
      statusBarIconBrightness:
      Brightness.dark ,
      systemNavigationBarColor:
      Color.fromRGBO(237,245,255,1),
      systemNavigationBarIconBrightness:
     Brightness.dark ,
  );

  final dark = SystemUiOverlayStyle(
    statusBarColor:
    Colors.grey.shade900,
    statusBarIconBrightness:
     Brightness.light,
    systemNavigationBarColor:
    Color.fromRGBO(63,72,79,1),
    systemNavigationBarIconBrightness:
     Brightness.light,
  );

final lightTheme=ThemeData(brightness: Brightness.light,
scaffoldBackgroundColor: Colors.white,);


  final darkTheme=ThemeData(brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey.shade800);







int aplicationID=2;

