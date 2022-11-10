import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restart_app/restart_app.dart';
import '../Firebase/Components/Constants.dart';
import '../Firebase/Models/order_model.dart';







class ClientOrderScreen extends StatelessWidget {
  ClientOrderScreen({Key key,this.ordersModel}) : super(key: key);
  OrdersModel ordersModel;

  @override

  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    var brightness= MediaQuery.of(context).platformBrightness;
    return Obx(()=>
       Scaffold(

        floatingActionButton: foodController.singleOrder.isEmpty?null:FloatingActionButton.extended(
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
                          foregroundColor: Color.fromRGBO(0, 66, 154, 1), backgroundColor: Colors.white)),
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
          body:Obx(()=>
          foodController.singleOrder.isEmpty?
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Order Not Showing ?'.tr,style: TextStyle(fontSize: 18),),
              SizedBox(height: 30,),
              Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      width: size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(

                            style:ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Color.fromRGBO(222,167,0,1)) ,
                            onPressed: (){Restart.restartApp();},
                            child:Text('Refresh'.tr)),
                      ))),
            ],
          ):

       Obx(()=>
           ListView.builder(
                itemCount:foodController.singleOrder.isNotEmpty?foodController.singleOrder.single.order.length:foodController.singleOrder.length,
                itemExtent: size.height*0.14,
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
                            imageUrl:foodController.singleOrder.first.order[index].image,
                            width: size.width*0.25,
height: size.height*0.80,

                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(foodController
                            .singleOrder.first.order[index].name,style:
                        TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(foodController
                                .singleOrder.first.order[index].price.toString()+'  SP',style:
                  TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,),
                          )],)


                      ],
                    ),
                  );



                }
            ),
       )
   )),
    );
  }
}





