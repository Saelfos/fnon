import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'dart:ui';

import '../Firebase/Components/Constants.dart';

class ManageProductsScreen extends StatelessWidget {
  ManageProductsScreen({Key key}) : super(key: key);
  var _tapPosition;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
              color: brightness == Brightness.light
                  ? Colors.black
                  : Colors.white70),
          backgroundColor: brightness == Brightness.light
              ? Colors.white
              : Colors.grey.shade900,
          title: Text(
            'Manage Products'.tr,
            style: TextStyle(
                color: brightness == Brightness.light
                    ? Colors.black
                    : Colors.white70),
          ),
        ),
        backgroundColor: brightness == Brightness.light
      ? Colors.white
          : Colors.grey.shade900,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6),
              child: ListTile(
                //Title
                title: Text(
                  'All Products'.tr,
                  style: TextStyle(
                    color: brightness == Brightness.light
                        ? Colors.black
                        : Colors.white70,
                  ),
                ),
                //Subtitle
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Manage All Products'.tr,
                    style: TextStyle(color: Color.fromRGBO(222,167,0,1)),
                  ),
                ),
                trailing: Icon(
                  Icons.wysiwyg_outlined,
                  color: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white70,
                ),
              ),
            ),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: foodController.allProducts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      visualDensity: VisualDensity(vertical: 4),
                      leading: CachedNetworkImage(
                        imageUrl: foodController.allProducts[index].image,
                        fit: BoxFit.cover,
                        width:MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height*0.23,
                      ),
                      title: Text(foodController.allProducts[index].name),
                      subtitle: Text(
                          foodController.allProducts[index].price.toString()),
                      trailing: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            middleText: '',
                            title: 'Do You Want To Delete Product?',
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('No'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Color.fromRGBO(0, 66, 154, 1))),
                              ElevatedButton(
                                onPressed: () {

                                  void deleteProduct() {
                                    firebaseFirestore
                                        .collection('Products')
                                        .doc(foodController
                                            .allProducts[index].name)
                                        .delete();
                                  }
                                  Get.back();
                                  deleteProduct();
                                },
                                child: Text('Delete'),
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(0, 66, 154, 1)),
                              ),
                            ],
                          );
                        },
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: brightness==Brightness.light?Colors.black:Colors.white,
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }
}
