import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../Firebase/Components/Constants.dart';
import 'Details_Screen.dart';


class ViewAllScreen extends StatelessWidget {
  ViewAllScreen(  {Key key, @required this.id, this.categoryId,}) : super(key: key);

 final int id;
final int categoryId;


  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    var brightness= MediaQuery.of(context).platformBrightness;
    return SafeArea(
      child: Scaffold(
        backgroundColor: brightness==Brightness.light?Colors.white:Colors.grey.shade900,

         appBar:  AppBar(
           elevation: 0,
           iconTheme: IconThemeData(
               color: brightness == Brightness.light
                   ? Colors.black:Colors.white70),
           backgroundColor: brightness == Brightness.light
               ? Colors.white
               : Colors.grey.shade900,
           title: Text(
             id == 1
                 ? 'Featured'.tr
                 : id == 2
                 ? 'Best Sellers'.tr
                 : id == 3
                 ? 'Discount'.tr
                 :id== 4?'New Arrival'.tr
                 :categoryId==1?'Skirts'.tr
                 : categoryId==2?'Blouse'.tr
                : categoryId==3?'Trouser'.tr
                 :categoryId==4?'Dresses'.tr
             :categoryId==5?'Over Coats'.tr:
             categoryId==6?'Jackets'.tr:
             categoryId==7?'Boots'.tr:'Bags'.tr,
             style: TextStyle(
                 color:brightness == Brightness.light
                     ? Colors.black:Colors.white70),
           ),
         ),

          body: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Obx(
              () => GridView.builder(
                  itemCount: id == 1
                      ? foodController.featured.length
                      : id == 2
                          ? foodController.bestSellers.length
                          : id == 3
                              ? foodController.discount.length
                              : id==4?foodController.newArrival.length:
                  categoryId==1?foodController.skirts.length:
                 categoryId==2? foodController.blouse.length:
                 categoryId==3? foodController.trousers.length:
                 categoryId==4? foodController.dress.length:
                 categoryId==5? foodController.longJacket.length:
                 categoryId==6? foodController.jacket.length:
                 categoryId==7? foodController.boots.length:
                  foodController.bags.length,


                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: size.height * 0.01,
                    childAspectRatio: 0.69,
                    mainAxisExtent: 280
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return

                      OpenContainer(
                          closedColor: brightness==Brightness.light?Colors.white:Colors.grey.shade900,
                          openColor:brightness== Brightness.light ? Colors.white : Colors.grey.shade900,
                          middleColor: Colors.transparent,
                          closedElevation: 0,
                          transitionType: ContainerTransitionType.fadeThrough,
                          closedBuilder: (BuildContext _,VoidCallback openContainer){
                           return InkWell(
                              onTap: openContainer,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: GridTile(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(25.0),
                                            child: CachedNetworkImage(
                                                imageUrl:  id == 1
                                                  ?  '${foodController.featured[index].image}'
                                                    : id == 2
                                                  ? '${foodController.bestSellers[index].image}'
                                                  : id == 3
                                                  ? '${foodController.discount[index].image}'
                                                  :id==4? '${foodController.newArrival[index].image}':
                                              categoryId==1?'${foodController.skirts[index].image}':
                                              categoryId==2?'${foodController.blouse[index].image}':
                                              categoryId==3?'${foodController.trousers[index].image}':
                                              categoryId==4?'${foodController.dress[index].image}':
                                              categoryId==5?'${foodController.longJacket[index].image}':
                                              categoryId==6?'${foodController.jacket[index].image}':
                                              categoryId==7?'${foodController.boots[index].image}':
                                              '${foodController.bags[index].image}',




                                              width: MediaQuery.of(context).size.width *
                                                  0.32,
                                              height: MediaQuery.of(context).size.height *
                                                  0.23,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 15,
                                            ),
                                          ),
                                          Text(
                                            id == 1
                                                ? GetStorage().read('language')==1?
                                            foodController.featured[index].name:foodController.featured[index].arabic
                                                : id == 2
                                                ? GetStorage().read('language')==1?
                                            foodController.bestSellers[index].name:foodController.bestSellers[index].arabic
                                                : id == 3
                                                ? GetStorage().read('language')==1?
                                            foodController.discount[index].name:foodController.discount[index].arabic
                                                : id==4?GetStorage().read('language')==1?
                                            foodController.newArrival[index].name:foodController.newArrival[index].arabic:
                                            categoryId==1?GetStorage().read('language')==1?
                                            foodController.skirts[index].name:foodController.skirts[index].arabic:
                                            categoryId==2?
                                            GetStorage().read('language')==1?
                                            foodController.blouse[index].name:foodController.blouse[index].arabic:
                                            categoryId==3?
                                            GetStorage().read('language')==1?
                                            foodController.trousers[index].name:foodController.trousers[index].arabic:
                                            categoryId==4?
                                            GetStorage().read('language')==1?
                                            foodController.dress[index].name:foodController.dress[index].arabic:
                                            categoryId==5?
                                            GetStorage().read('language')==1?
                                            foodController.longJacket[index].name:foodController.longJacket[index].arabic:
                                            categoryId==6?
                                            GetStorage().read('language')==1?
                                            foodController.jacket[index].name:foodController.jacket[index].arabic:
                                            categoryId==7?
                                            GetStorage().read('language')==1?
                                            foodController.boots[index].name:foodController.boots[index].arabic:
                                            GetStorage().read('language')==1?
                                            foodController.bags[index].name:foodController.bags[index].arabic,


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
                                            id == 1
                                                ? foodController.featured[index].price.toString()+'  SP'
                                                : id == 2
                                                ? foodController.bestSellers[index].price.toString()+'  SP'
                                                : id == 3
                                                ?foodController.discount[index].price.toString()+'  SP'
                                                : id==4?foodController.newArrival[index].price.toString()+'  SP':
                                            categoryId==1?foodController.skirts[index].price.toString()+'  SP':
                                           categoryId==2? foodController.blouse[index].price.toString()+'  SP':
                                           categoryId==3? foodController.trousers[index].price.toString()+'  SP':
                                           categoryId==4? foodController.dress[index].price.toString()+'  SP':
                                           categoryId==5? foodController.longJacket[index].price.toString()+'  SP':
                                           categoryId==6? foodController.jacket[index].price.toString()+'  SP':
                                           categoryId==7? foodController.boots[index].price.toString()+'  SP':
                                           foodController.blouse[index].arabic.toString()+'  SP' ,

                                            style: TextStyle(
                                                color: brightness == Brightness.light
                                                    ? Colors.black54
                                                    : Colors.white60,
                                                fontSize: 12.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            );



                          }, openBuilder: (BuildContext _,VoidCallback __) {
                            return Details(
                          featured: id==1?foodController.featured[index]:null,
                          bestSellers: id==2?foodController.bestSellers[index]:null,
                          discount: id==3?foodController.discount[index]:null,
                          newArrival:id==4? foodController.newArrival[index]:null,
                              skirts: categoryId==1?foodController.skirts[index]:null,
                              blouse: categoryId==2?foodController.blouse[index]:null,
                              trousers: categoryId==3?foodController.trousers[index]:null,
                              dress: categoryId==4?foodController.dress[index]:null,
                              longJacket: categoryId==5?foodController.longJacket[index]:null,
                              jacket: categoryId==6?foodController.jacket[index]:null,
                              boots: categoryId==7?foodController.boots[index]:null,
                              bags: categoryId==8?foodController.bags[index]:null,
                          id: id == 1
                              ? 1
                              : id == 2
                              ? 2
                              : id == 3
                              ? 3:
                              id==4? 4:null,
                          categoryId: categoryId==1?1:categoryId==2?2:categoryId==3?3:categoryId==4?4:
                          categoryId==5?5:categoryId==6?6:categoryId==7?7:categoryId==8?8:null,
                          ); },

                      );
                  }),
            ),
          ),
        ),
      );
  }
}
