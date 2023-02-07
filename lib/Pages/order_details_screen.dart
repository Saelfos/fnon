import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../Firebase/Components/Constants.dart';
import '../Firebase/Models/order_model.dart';






class OrderDetails extends StatelessWidget {
   OrderDetails({Key key,this.ordersModel}) : super(key: key);
OrdersModel ordersModel;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var brightness= MediaQuery.of(context).platformBrightness;
    return Scaffold(
      backgroundColor: brightness==Brightness.light?Colors.white:Colors.grey.shade900,
      appBar:  AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: brightness == Brightness.light
                ? Color.fromRGBO(0,66,154,1):Colors.white70),
        backgroundColor: brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        title: Text(ordersModel.clientName,style: TextStyle(color:brightness==Brightness.light?Colors.black:Colors.white),
        ),
      ),
body: ListView.builder(
  physics: BouncingScrollPhysics(),
  itemCount: ordersModel.order.length,
    itemExtent: size.height*0.15,
    itemBuilder: (context, index) {
  return  Padding(
    padding: const EdgeInsets.only(top: 20.0,left: 12,right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
                imageUrl:ordersModel.order[index].image,
width: size.width*0.25,

               ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width*0.55,
              child: Text(ordersModel.order[index].name,style:
              TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
            )
            ,Text(''),
          ],
        ),

      ],
    ),
  );



}
)
    );
  }
}





