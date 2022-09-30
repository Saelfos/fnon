

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Firebase/Components/Constants.dart';
import 'Firebase/Controllers/Food_Controller.dart';
import 'Firebase/Controllers/Language_Controller.dart';
import 'Widgets/NavigationBar.dart';
import 'Firebase/Components/Translations.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.put(FoodController());

  });
  await GetStorage.init();

  runApp(
      Fnon());
}

/// This is the main application widget.
class Fnon extends StatelessWidget {
  Fnon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

print(GetStorage().read('clientName'));
print(foodController.orderList.length);
    double screenHeight = window.physicalSize.height;
    double screenWidth = window.physicalSize.width;
    // print('${GetStorage().read('language')}');
    final LanguageController languageController = Get.put(LanguageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode:ThemeMode.system,
     home: Navigation(),
      translations:Translation() ,

    );
  }
}


