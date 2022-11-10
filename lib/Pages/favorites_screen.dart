import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';


import '../Firebase/Models/Cart_Model.dart';
import '../Firebase/Models/all_products_screen.dart';
import '../main.dart';
import 'details_screen.dart';

class Favorites extends StatelessWidget {
  Favorites({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return
      ListView(
        physics:BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6),
            child: ListTile(
              //Title
              title: Text('Favorites'.tr,style: TextStyle(color: brightness == Brightness.light
                  ? Colors.black87:Colors.white70),),
              //Subtitle
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('Your Favorite Items'.tr,style: TextStyle(color:  Color.fromRGBO(222,167,0,1)),),
              ),
              trailing: Icon(Icons.favorite_border_outlined,color: brightness == Brightness.light
                  ? Colors.black87
                  : Colors.white70,),
            ),
          ),
    Obx(()=>
    GridView.builder(
    itemCount:favoritesList.length,
    scrollDirection: Axis.vertical,
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
    childAspectRatio: .60,
    mainAxisSpacing: 0,
    crossAxisSpacing:0,
    mainAxisExtent: 280),
    itemBuilder: (BuildContext context, int index) {
    return CartItemWidget(
    index: index,
    );
    },
    ),
    )

    ],
      );

  }
}

class CartItemWidget extends StatelessWidget {
  CartItemWidget({Key key, this.index,this.featured}) : super(key: key);
   Featured featured;
CartItem cartItem;
  var _tapPosition;

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
              onTapDown: _storePosition,
              onLongPress: (){
                  _showPop() async {
                    final RenderBox overlay = Overlay
                        .of(context)
                        .context
                        .findRenderObject();
                    await showMenu(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(17))
                        ),
                        context: context,
                        position: RelativeRect.fromRect(
                            _tapPosition&Size(40, 40),
                            Offset.zero&overlay.size),
                        items: [
                          PopupMenuItem(
                              padding: EdgeInsets.all(8),
                              height: 35,
                              onTap: () {
                                favoritesList.remove(favoritesList[index]);

                                var favAsMap=favoritesList.map((e) => e.toJson()).toList();
                                String jsonFavString=jsonEncode(favAsMap);
                                GetStorage().write('fav', jsonFavString);
                              },
                              child: Row(children: [
                                Icon(Icons.remove_circle_outline_rounded),
                                Text("Remove Item".tr),

                              ]))
                        ]);
                  }
                  _showPop();
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
                            imageUrl:favoritesList[index].image
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
                      Text(
                        GetStorage().read('language')==1?
                      favoritesList[index].name:favoritesList[index].arabic,
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
                        favoritesList[index].price.toString()+'  SP',
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
id: 111,
          favoriteItem:favoritesList[index],
        );
      },

    );

  }

  void _storePosition(TapDownDetails details){
    _tapPosition=details.globalPosition;}
}


class FavoritesModel {
  String image;
  String name;
  String arabic;
  int price;
  String size;

  FavoritesModel({ @required this.image, @required this.name,@required this.price,@required this.arabic,this.size});


  FavoritesModel.fromJson(Map<String,dynamic>json){
    this.image=json['image'];
    this.name=json['name'];
    this.price=json['price'];
    this.arabic=json['arabic'];
    this.size=json['size'];
  }

  Map<String, dynamic> toJson() {
    return {
      'image': this.image,
      'name': this.name,
      'arabic': this.arabic,
      'price': this.price,
      'size': this.size,
    };
  }
}





var readStorage1=GetStorage().read('fav');
List jsonFav=jsonDecode(readStorage1);

List<FavoritesModel> favoritesList=GetStorage().read('fav')!=null?
jsonFav.map((f)=>FavoritesModel.fromJson(f)).toList().obs:RxList<FavoritesModel>([]);


