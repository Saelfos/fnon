import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return SafeArea(
      child: Scaffold(
        backgroundColor:  brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
              color: brightness == Brightness.light
                  ? Colors.black:Colors.white70),
          backgroundColor: brightness == Brightness.light
              ? Colors.white
              : Colors.grey.shade900,
          title: Text('About application'.tr,style: TextStyle(
              color:brightness == Brightness.light
                  ? Colors.black:Colors.white70),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [

            Center(child: Text('Developed by Saelmaka Ltd ',style: TextStyle(fontSize: 22,color: brightness==Brightness.light?Colors.black:Colors.white),)),
            SizedBox(height: 22,),
            Center(child: Text('for application development',style: TextStyle(fontSize: 22,color: brightness==Brightness.light?Colors.black:Colors.white),),),
            SizedBox(height: 22,),
            Center(child: Text('Damascus-Syria',style: TextStyle(fontSize: 22,color: brightness==Brightness.light?Colors.black:Colors.white),),),
            SizedBox(height: 22,),
            Center(child: Text('963-951-482-066',style: TextStyle(fontSize: 22,color: brightness==Brightness.light?Colors.black:Colors.white),),)
          ],
        ),

      ),
    );
  }
}
