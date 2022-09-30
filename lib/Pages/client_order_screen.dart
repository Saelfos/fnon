import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import 'package:restart_app/restart_app.dart';

import '../Firebase/Components/Constants.dart';
import '../Firebase/Controllers/Food_Controller.dart';
import '../Firebase/Models/order_model.dart';







class ClientOrderScreen extends StatefulWidget {
  ClientOrderScreen({Key key,this.ordersModel}) : super(key: key);
  OrdersModel ordersModel;
FoodController foodController =Get.put(FoodController());

  @override
  State<ClientOrderScreen> createState() => _ClientOrderScreenState();
}

class _ClientOrderScreenState extends State<ClientOrderScreen> {

  @override

  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    var brightness= MediaQuery.of(context).platformBrightness;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: foodController.orderList.isEmpty?null:FloatingActionButton.extended(
          backgroundColor: Color.fromRGBO(222,167,0,1),
            onPressed: (){
              Get.defaultDialog(
                middleText: '',
                title: 'Delete Order?',
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
                            .collection('orders')
                            .doc(GetStorage().read('clientName'))
                            .delete().then((value) =>  ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar3)));
                      }
                      Get.back();
                      deleteProduct();
                      Future.delayed(Duration(seconds: 1),(){setState(() {

                      });});
                    },
                    child: Text('Delete',),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 66, 154, 1)),
                  ),
                ],
              );
            }, label: Text('Cancel Order'.tr,style: TextStyle(color: Colors.black),)
            ,icon: Icon(Icons.remove_circle_outline,color: Colors.black,)),
          backgroundColor: brightness==Brightness.light?Colors.white:Colors.grey.shade900,
          body:
              foodController.orderList.isEmpty?
                  Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Order Not Showing ?'.tr,style: TextStyle(fontSize: 18),),
                      SizedBox(height: 30,),
                      Center(
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              height: 50,
                              width: size.width * 0.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                            child: ElevatedButton(

                              style:ElevatedButton.styleFrom(primary: Color.fromRGBO(222,167,0,1),
                              onPrimary: Colors.black) ,
                                onPressed: (){Restart.restartApp();},
                                child:Text('Refresh'.tr)),
                          ))),
                    ],
                  ):

    Obx(()=> ListView.builder(
              itemCount:foodController.orderList.isNotEmpty?foodController.orderList.single.order.length:0,
              itemExtent: size.height*0.20,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:foodController.orderList.first.order[index].image,
                          width: size.width*0.25,
height: size.height*0.80,

                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(foodController
                          .orderList.first.order[index].name,style:
                      TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(foodController
                              .orderList.first.order[index].price.toString()+'  SP',style:
                TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,),
                        )],)


                    ],
                  ),
                );



              }
          )
   )),
    );
  }
}





