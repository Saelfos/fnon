import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../Firebase/Models/Cart_Model.dart';
import '../main.dart';
import 'Details_Screen.dart';
import 'Favorites_Screen.dart';
import 'add_order_screen.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: brightness == Brightness.light
                ? Colors.black:Colors.white70),
        backgroundColor: brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        title: Text(
          'Cart'.tr,
          style: TextStyle(
              color: brightness == Brightness.light
                  ? Colors.black:Colors.white70),
        ),
      ),
      floatingActionButton:
      shoppingCartList.length==0?null:
      FloatingActionButton.extended(

        backgroundColor: Color.fromRGBO(222,167,0,1),
        onPressed: (){Get.to(()=> AddOrderScreen());},
        icon: Icon(Icons.add,color: Colors.black,),
        label: Text('Add Order'.tr,style: TextStyle(color: Colors.black)),
      ),
      backgroundColor:
        brightness == Brightness.light ? Colors.white: Colors.grey.shade900,
      body: Obx(()=>
         GridView.builder(
          itemCount:shoppingCartList.length,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
              childAspectRatio: .60,
              mainAxisSpacing: 0,
              crossAxisSpacing:0 ,
          mainAxisExtent: 280),
          itemBuilder: (BuildContext context, int index) {
            return ShoppingCartWidget(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class ShoppingCartWidget extends StatelessWidget {
  ShoppingCartWidget({Key key, this.index,}) : super(key: key);

  CartItem cartItem;
  int index;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return OpenContainer(
      closedColor:
      brightness == Brightness.light ? Colors.white : Colors.grey.shade900,
      openColor:brightness== Brightness.light ? Colors.white : Colors.grey.shade900,
      closedElevation: 0,
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return Padding(
            padding: const EdgeInsets.only(left: 14, right: 10),
            child: InkWell(
onLongPress: (){
  shoppingCartList.remove(shoppingCartList[index]);

  var shopCartAsMap=shoppingCartList.map((e) => e.toJson()).toList();
  String jsonShopCartString=jsonEncode(shopCartAsMap);
 GetStorage().write('shop', jsonShopCartString);

},
              onTap: openContainer,
              child: GridTile(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: CachedNetworkImage(
                            imageUrl:shoppingCartList[index].image
                            ,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.32,
                            height: MediaQuery.of(context).size.height * 0.23,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                      ),
                      Text(GetStorage().read('language')==1?
                        shoppingCartList[index].name:shoppingCartList[index].arabic,
                        style: TextStyle(
                            color: brightness == Brightness.light
                                ? Colors.black87
                                : Colors.white,
                            fontSize: 14,overflow: TextOverflow.ellipsis),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                      ),
                      Text(
                        shoppingCartList[index].price.toString()+'  EGP',
                        style: TextStyle(
                            color: brightness == Brightness.light
                                ? Colors.black54
                                : Colors.white60,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
      openBuilder: (BuildContext _, VoidCallback __) {
        return Details(
          shoppingCartItem: shoppingCartList[index],
          id: 222,
        );
      },

    );
  }
}


class ShoppingCartModel{
  String image;
  String name;
  String arabic;
  int price;
  String size;


  static const NAME = "name";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const ARABIC = "arabic";
  static const SIZE= 'size';


  ShoppingCartModel.fromJson(Map<String,dynamic>json){
    this.image=json['image'];
    this.name=json['name'];
    this.price=json['price'];
    this.arabic=json['arabic'];
    this.size=json['size'];
  }



  ShoppingCartModel({ this.image, this.name, this.price, this.arabic,this.size});
  Map<String, dynamic> toJson() {
    return {
      'image': this.image,
      'name': this.name,
      'arabic': this.arabic,
      'price': this.price,
      'size':this.size,
    };
  }

  ShoppingCartModel.fromMap(Map<dynamic, dynamic> data){
    name = data[NAME];
    image = data[IMAGE];
    price = data[PRICE];
    arabic = data[ARABIC];
    size =data[SIZE];
  }

}




var readStorage2=GetStorage().read('shop');
List jsonshop=jsonDecode(readStorage2);

RxList<ShoppingCartModel> shoppingCartList=GetStorage().read('shop')!=null?
jsonshop.map((f)=>ShoppingCartModel.fromJson(f)).toList().obs:RxList<ShoppingCartModel>([]);