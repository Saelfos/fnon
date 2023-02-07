
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Firebase/Components/Constants.dart';
import 'order_details_screen.dart';




class OrdersScreen extends StatefulWidget {
   OrdersScreen({Key key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      backgroundColor: brightness==Brightness.light?Colors.white:Colors.grey.shade900,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6),
            child: ListTile(
              //Title
              title: Text('Orders'.tr,style: TextStyle(color:brightness == Brightness.light
                  ? Colors.black87
                  : Colors.white70,),),
              //Subtitle
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('All Orders'.tr,style: TextStyle(color:  Color.fromRGBO(222,167,0,1)),),
              ),
              trailing: Icon(Icons.wysiwyg_outlined,color: brightness == Brightness.light
                  ? Colors.black87
                  : Colors.white70,),
            ),
          ),
          Obx(()=>
             ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: foodController.orders.length,
                itemBuilder: (context, index) {
                  return OpenContainer(
                      closedColor: brightness == Brightness.light
                      ? Colors.white
                          : Colors.grey.shade900,
                      middleColor: brightness == Brightness.light
                      ? Colors.white
                          : Colors.grey.shade900,
                      openColor: brightness == Brightness.light
                      ? Colors.white
                          : Colors.grey.shade900,
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fadeThrough,
                      closedBuilder: (BuildContext _, VoidCallback openContainer) {
                    return
                      ListTile(
leading: IconButton(
  icon:Icon(Icons.delete_outline_outlined,color:brightness==Brightness.light? Colors.black:Colors.white,),
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
                  .doc(foodController
                  .orders[index].clientName)
                  .delete().then((value) =>  ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar3)));
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




},),
                        title: Text(foodController.orders[index].clientName),
                        subtitle: Text(foodController.orders[index].phoneNumber.toString()),
                        trailing: Text('#${(index+1)}'),
                      );
                    },
                        openBuilder: (BuildContext _, VoidCallback __) {
                      return OrderDetails(ordersModel: foodController.orders[index],);
                    });
                }),
          ),
        ],
      ),
    );
  }
}
