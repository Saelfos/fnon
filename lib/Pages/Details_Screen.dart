import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fnon/Pages/shopping_cart_screen.dart';
import 'package:fnon/Widgets/photo_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../Firebase/Components/Constants.dart';
import '../Firebase/Models/all_products_screen.dart';
import 'Account_Widgets/rounded_button.dart';
import 'Favorites_Screen.dart';

var favAsMap=favoritesList.map((e) => e.toJson()).toList();
String jsonFavString=jsonEncode(favAsMap);

var shopCartAsMap=shoppingCartList.map((e) => e.toJson()).toList();
String jsonShopCartString=jsonEncode(shopCartAsMap);


class Details extends StatelessWidget {
  Details({Key key, this.featured, this.bestSellers, this.discount, this.newArrival, this.skirts, this.id,
      this.blouse, this.index,this.boots,this.longJacket,
    this.trousers,this.kettle,this.bags,this.jacket,this.dress,this.granite,this.granitePlus,
  this.nouval,this.lovelyHearts,this.turkishProducts,this.timeLess,this.favoriteItem,this.shoppingCartItem,this.categoryId,this.allProducts })
      : super(key: key);
Featured allProducts;
  FavoritesModel favoriteItem;
  ShoppingCartModel shoppingCartItem;
  Blouse blouse;
  Featured featured;
  BestSellers bestSellers;
  Discount discount;
  NewArrival newArrival;
  Skirts skirts;
  Trousers trousers;
  LongJacket longJacket;
  Boots boots;
  int id;
  int index;
  Dress dress;
  Kettle kettle;
  Bags bags;
  Jacket jacket;
  Granite granite;
  GranitePlus granitePlus;
  LovelyHearts lovelyHearts;
  Nouval nouval;
  TurkishProducts turkishProducts;
  TimeLess timeLess;
  final int categoryId;




  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child:
            Scaffold(
              backgroundColor: brightness==Brightness.light?Colors.white:Colors.grey.shade900,
              body: CustomScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: <Widget>[
                  SliverAppBar(

                    pinned: true,
                    iconTheme: IconThemeData(
                        color: brightness == Brightness.light
                            ? Colors.black87
                            : Colors.white),
                    backgroundColor: brightness == Brightness.light
                        ? Colors.white
                        : Colors.grey.shade900,
                    expandedHeight: size.height*0.7,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      //Title
                      title: Text(
                       ''
                      ),
                      background: OpenContainer(
         closedColor: brightness==Brightness.light?Colors.white70:Colors.grey.shade900,
      openColor: brightness==Brightness.light?Colors.white70:Colors.grey.shade900,
     middleColor:brightness==Brightness.light?Colors.white70:Colors.grey.shade900,
     closedElevation: 0,
     transitionType: ContainerTransitionType.fadeThrough,
     closedBuilder: (BuildContext _, VoidCallback openContainer) {
       return InkWell(
         onTap: openContainer,
         child: CachedNetworkImage(

           imageUrl:
               id==333?allProducts.image:
           id == 111 ? favoriteItem.image :
           id == 222 ? shoppingCartItem.image :
           id == 1 ?
           featured.image
               : id == 2
               ? bestSellers.image
               : id == 3
               ? discount.image
               : id == 4
               ? newArrival.image
               : categoryId == 1
               ? skirts.image
               : categoryId == 2 ? blouse.image :
           categoryId==3?trousers.image:
           categoryId==4?dress.image:
           categoryId==5?longJacket.image:
           categoryId==6?jacket.image:
           categoryId==7?boots.image:
           bags.image,
           fit: BoxFit.cover,
         ),
       );
     }, openBuilder: (BuildContext context, void Function({Object returnValue}) action) {
                            return PhotoViewPage(
                            image:id==111?favoriteItem.image:
                            id==222?shoppingCartItem.image:
                                id==333?allProducts.image:
                            id == 1?
                            featured.image
                                : id == 2
                                ? bestSellers.image
                                : id == 3
                                ? discount.image
                                : id == 4
                                ? newArrival.image
                                : categoryId == 1
                                ? skirts.image
                                :categoryId==2? blouse.image
                                :categoryId==3?trousers.image:
                                categoryId==4?dress.image:
                                    categoryId==5?longJacket.image:
                                    categoryId==6?jacket.image:
                                        categoryId==7?
                                        boots.image:
                                            bags.image
                        );

                      },
     ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Column(
                          children: [
                            SizedBox(height:size.height*0.04 ,),

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
                              width: size.width * 0.8,

                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255,235,175,1),

                                borderRadius: BorderRadius.circular(29),
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.drive_file_rename_outline,color: Colors.black,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10,left: 10),
                                    child: Text(
                                      id==111? GetStorage().read('language')==1?
                                      favoriteItem.name:favoriteItem.arabic:
                                      id==222? GetStorage().read('language')==1?
                                      shoppingCartItem.name:shoppingCartItem.arabic:
                                          id==333?GetStorage().read('language')==1?
                                          allProducts.name:allProducts.arabic:
                                      id == 1
                                          ? GetStorage().read('language')==1?
                                      featured.name:featured.arabic
                                          : id == 2
                                          ?  GetStorage().read('language')==1?
                                      bestSellers.name:bestSellers.arabic
                                          : id == 3
                                          ? GetStorage().read('language')==1?
                                      discount.name:discount.arabic
                                          : id == 4
                                          ? GetStorage().read('language')==1?
                                      newArrival.name:newArrival.arabic

                                          : categoryId == 1
                                          ? GetStorage().read('language')==1?
                                      skirts.name:skirts.arabic

                                          : categoryId==2?GetStorage().read('language')==1?
                                      blouse.name:blouse.arabic:

                                      categoryId==3?GetStorage().read('language')==1?
                                      trousers.name:trousers.arabic:

                                      categoryId==4?GetStorage().read('language')==1?
                                      dress.name:dress.arabic:

                                      categoryId==5?GetStorage().read('language')==1?
                                      longJacket.name:longJacket.arabic:

                                      categoryId==6?GetStorage().read('language')==1?
                                      jacket.name:jacket.arabic:

                                      categoryId==7?GetStorage().read('language')==1?
                                      boots.name:boots.arabic:GetStorage().read('language')==1?
                                      bags.name:bags.arabic,
                                      style: TextStyle(
                                        color: brightness == Brightness.light
                                            ? Colors.black
                                            : Colors.black,fontSize: 18,),
                                    ),
                                  ),
                                ],
                              ),
                            ) ,
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical:15),
                              width: size.width * 0.8,

                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255,235,175,1),

                                borderRadius: BorderRadius.circular(29),
                              ),
                              child:
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                    Text('SP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                     Padding(
                                       padding: const EdgeInsets.only(right: 10,left: 10),
                                       child: Text(
                                        id==111?favoriteItem.price.toString():
                                id==222?shoppingCartItem.price.toString():
                                    id==333?allProducts.price.toString():
                                id == 1?
                                featured.price.toString()
                                          : id == 2
                                          ? bestSellers.price.toString()
                                          : id == 3
                                          ? discount.price.toString()
                                          : id == 4
                                          ? newArrival.price.toString()
                                          : categoryId == 1 ? skirts.price.toString()
                                          :categoryId==2? blouse.price.toString():
                                categoryId==3?trousers.price.toString():
                                categoryId==4?dress.price.toString():
                                categoryId==5?longJacket.price.toString():
                                categoryId==6?jacket.price.toString():
                                categoryId==7?boots.price.toString():
                                bags.price.toString(),style: TextStyle(
                                        color: brightness == Brightness.light
                                            ? Colors.black
                                            : Colors.black,fontSize: 18,),),
                                     ),
                                   ],
                                 ),

                            ) ,Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical:15),
                              width: size.width * 0.8,

                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255,235,175,1),

                                borderRadius: BorderRadius.circular(29),
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.height,color: Colors.black,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10,left: 10),
                                    child: Text(
                                      ''
                                    //   id==111?favoriteItem.size:
                                    // id==222?shoppingCartItem.size:
                                    // id == 1?
                                    // featured.size
                                    //     : id == 2
                                    //     ? bestSellers.size
                                    //     : id == 3
                                    //     ? discount.size
                                    //     : id == 4
                                    //     ? newArrival.size
                                    //     : categoryId == 1
                                    //     ? skirts.size
                                    //     :categoryId==2? blouse.size
                                    //     :categoryId==3?trousers.size:
                                    // categoryId==4?dress.size:
                                    // categoryId==5?longJacket.size:
                                    // categoryId==6?jacket.size:
                                    // categoryId==7?
                                    // boots.size:
                                    // bags.size
                                      ,style: TextStyle(
                                      color: brightness == Brightness.light
                                          ? Colors.black
                                          : Colors.black,fontSize: 18,),),
                                  ),
                                ],
                              ),
                            ) ,


                         id==111?SizedBox():id==222?SizedBox():RoundedButton(
                           icon: Icon(Icons.favorite_border_outlined),
                color: Color.fromRGBO(222,167,0,1),
                text: "Add To Favorites".tr,secondColor: brightness==Brightness.light?Colors.black:Colors.black,

                onTap: () {
                             addToFavorites()async
                             {ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar2));
                               await
                             {
                               favoritesList.add(
                                   FavoritesModel(
                                     //ArabicName
                                       arabic:id==333?allProducts.arabic: id==1? featured.arabic: id==2? bestSellers.arabic: id==3? discount.arabic: id==4?newArrival.arabic:
                                       categoryId==2? blouse.arabic: categoryId==1?skirts.arabic:categoryId==3?trousers.arabic:categoryId==4?dress.arabic:
                                       categoryId==5?longJacket.arabic:categoryId==6?jacket.arabic:categoryId==7?boots.arabic:bags.arabic,
                                       //Image
                                       image:id==333?allProducts.image:id==1? featured.image: id==2? bestSellers.image: id==3? discount.image: id==4?newArrival.image:
                                       categoryId==2? blouse.image: categoryId==1?skirts.image:categoryId==3?trousers.image:categoryId==4?dress.image:
                                       categoryId==5?longJacket.image:categoryId==6?jacket.image:categoryId==7?boots.image:bags.arabic,
                                       //Name
                                       name:id==333?allProducts.name:id==1? featured.name: id==2? bestSellers.name: id==3? discount.name: id==4?newArrival.name:
                                       categoryId==2? blouse.name: categoryId==1?skirts.name:categoryId==3?trousers.name:categoryId==4?dress.name:
                                       categoryId==5?longJacket.name:categoryId==6?jacket.name:categoryId==7?boots.name:bags.arabic,

                                       //Price
                                       price:id==333?allProducts.price:id==1? featured.price: id==2? bestSellers.price: id==3? discount.price: id==4?newArrival.price:
                                       categoryId==2? blouse.price: categoryId==1?skirts.price:categoryId==3?trousers.price:categoryId==4?dress.price:
                                       categoryId==5?longJacket.price:categoryId==6?jacket.price:categoryId==7?boots.price:bags.price,

                                       size:id==333?allProducts.size:id==1? featured.size: id==2? bestSellers.size: id==3? discount.size: id==4?newArrival.size:
                                       categoryId==2? blouse.size: categoryId==1?skirts.size:categoryId==3?trousers.size:categoryId==4?dress.size:
                                       categoryId==5?longJacket.size:categoryId==6?jacket.size:categoryId==7?boots.size:bags.size


                                   ))};
                             };
                             addToFavorites();
                  var favAsMap=favoritesList.map((e) => e.toJson()).toList();
                  String jsonFavString=jsonEncode(favAsMap);
                  GetStorage().write('fav', jsonFavString);

                  print(favoritesList.length);
                  },
              ),
                           id==111?SizedBox():id==222?SizedBox():
                            RoundedButton(
icon: Icon(Icons.add_shopping_cart_outlined),
                              color: Color.fromRGBO(222,167,0,1),
                text: 'Add To Shopping Cart'.tr,secondColor:brightness==Brightness.light?Colors.black:Colors.black ,



                onTap: () {
  addToShoppingCart()async {
    {ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar2));
      await
    shoppingCartList.add(
        ShoppingCartModel(
          //ArabicName
          arabic:id==333?allProducts.arabic: id==1? featured.arabic: id==2? bestSellers.arabic: id==3? discount.arabic: id==4?newArrival.arabic:
          categoryId==2? blouse.arabic: categoryId==1?skirts.arabic:categoryId==3?trousers.arabic:categoryId==4?dress.arabic:
          categoryId==5?longJacket.arabic:categoryId==6?jacket.arabic:categoryId==7?boots.arabic:bags.arabic,
          //Image
          image:id==333?allProducts.image:id==1? featured.image: id==2? bestSellers.image: id==3? discount.image: id==4?newArrival.image:
          categoryId==2? blouse.image: categoryId==1?skirts.image:categoryId==3?trousers.image:categoryId==4?dress.image:
          categoryId==5?longJacket.image:categoryId==6?jacket.image:categoryId==7?boots.image:bags.image ,
          //Name
          name:id==333?allProducts.name:id==1? featured.name: id==2? bestSellers.name: id==3? discount.name: id==4?newArrival.name:
          categoryId==2? blouse.name: categoryId==1?skirts.name:categoryId==3?trousers.name:categoryId==4?dress.name:
          categoryId==5?longJacket.name:categoryId==6?jacket.name:categoryId==7?boots.name:bags.name,

          //Price
          price:id==333?allProducts.price:id==1? featured.price: id==2? bestSellers.price: id==3? discount.price: id==4?newArrival.price:
          categoryId==2? blouse.price: categoryId==1?skirts.price:categoryId==3?trousers.price:categoryId==4?dress.price:
          categoryId==5?longJacket.price:categoryId==6?jacket.price:categoryId==7?boots.price:bags.price,

          size:id==333?allProducts.size:id==1? featured.size: id==2? bestSellers.size: id==3? discount.size: id==4?newArrival.size:
          categoryId==2? blouse.size: categoryId==1?skirts.size:categoryId==3?trousers.size:categoryId==4?dress.size:
          categoryId==5?longJacket.size:categoryId==6?jacket.size:categoryId==7?boots.size:bags.size,));};
  }
addToShoppingCart();


                  var shopCartAsMap=shoppingCartList.map((e) => e.toJson()).toList();
                  String jsonShopCartString=jsonEncode(shopCartAsMap);

                  GetStorage().write('shop', jsonShopCartString);

                  },
              ),
            ]),
                          ],
                        ),

    )
                ],
                    ),
                  )
    );

  }
}



















class SearchDetails extends StatelessWidget {
 SearchDetails({Key key,this.cookStuff}) : super(key: key);
 Skirts cookStuff;


  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade100,
        child: Obx(()=>Icon(
            Icons.favorite)),
        foregroundColor: Colors.red,
        //OnTap
        onPressed: () {
          },
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            iconTheme: IconThemeData(
                color: brightness == Brightness.light
                    ? Colors.black87
                    : Colors.white),
            backgroundColor: brightness == Brightness.light
                ? Colors.white
                : Colors.grey.shade900,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              //Title
              title: Text(
                GetStorage().read('language')==1?
                cookStuff.name:cookStuff.arabic,
                style: TextStyle(
                    color: brightness == Brightness.light
                        ? Colors.black87
                        : Colors.white),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl:'${cookStuff.image}',
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 1.5),
                        end: Alignment.center,
                        colors: <Color>[
                          Color(0xFFFF0000),
                          Color(0x00FFFFFF),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ExpansionTile(
                    title: Text('Ingredients'),
                    children:[
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context,index){
                            return ListTile(
                                leading: Text('${(index+1)}-'),
                                title: Text(
                                    '${cookStuff.name[index]}'

                                ));
                          }
                      ),
                    ]
                ),
                ExpansionTile(
                    title: Text('Steps'),
                    children:[
                      ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context,index){
                            return ListTile(
                                leading: Text('${(index+1)}-'),
                                title: Text(
                                    '${cookStuff.name[index]}'

                                ));
                          }
                      ),
                    ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





