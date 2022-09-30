import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController{
  static LanguageController instance = Get.find();
  @override
  void onInit() {
Get.updateLocale(GetStorage().read('language')==1?Locale('en','US'):Locale('ar','SY'));
super.onInit();

  }
}