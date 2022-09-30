
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
    return SafeArea(
      child: Scaffold(
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
body: SingleChildScrollView(
  child:   Column(
  
      children: [
  
        SizedBox(height: 10,),
  
        Text('Address',style: TextStyle(fontSize:20,color:brightness==Brightness.light?Colors.black:Colors.white ),),
  
        SizedBox(height: 10,),
  
        Text(ordersModel.location,style: TextStyle(fontSize:18,color:brightness==Brightness.light?Colors.black:Colors.white ),),
  
        SizedBox(height: 10,),
  
        Text('Detailed Location',style: TextStyle(fontSize:20,color:brightness==Brightness.light?Colors.black:Colors.white ),),
  
        SizedBox(height: 10,),
  
        Text(ordersModel.detailedLocation,style: TextStyle(fontSize:18,color:brightness==Brightness.light?Colors.black:Colors.white ),),
  
            ListView.builder(
  
  shrinkWrap: true,
  
          physics: BouncingScrollPhysics(),
  
  
  
          itemCount: ordersModel.order.length,
  
  
  
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


                        imageUrl:ordersModel.order[index].image,



        width: size.width*0.25,
                    height: size.height*0.80,







                       ),



                ),



                Column(



                  mainAxisAlignment: MainAxisAlignment.center,



                  children: [



                    Text(ordersModel.order[index].name,style:


                    TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,)



                    ,Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ordersModel.order[index].price.toString()+'  SP',style:


                      TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,),
                    ),



                  ],



                ),







              ],



            ),
  
  
  
          );
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
        }
  
  
  
        ),
  
      ],
  
  ),
)
      ),
    );
  }
}





