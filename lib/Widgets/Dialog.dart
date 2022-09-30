
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'Settings.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery
        .of(context)
        .platformBrightness;
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
            backgroundColor: brightness == Brightness.light
                ? Colors.white
                : Colors.grey.shade900,
            title: "Foodo",
            content: Container(
                child:
                Column(children: [
                       ListTile(
                    onTap: () {

                    },
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text('Account'.tr),
                  ),
                  ListTile(
                    onTap: () {
                      Get.back();
Get.to(() =>  SettingsPage());
                    },
                    title: Text('Settings'.tr),
                    leading: Icon(Icons.settings),
                  ),

                  ListTile(
                    onTap: () {},
                    title: Text('About'.tr),
                    leading: Icon(Icons.assignment_late_outlined),
                  )
                ])));
      },

      child: CircleAvatar(
        backgroundColor: brightness == Brightness.light
            ? Color.fromRGBO(69, 71, 70, 1)
            : Colors.white70,
        radius: MediaQuery
            .of(context)
            .size
            .width * 0.045,
        child: Text("EM"),
      ),
    );
  }
}

