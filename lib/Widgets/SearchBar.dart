
import 'dart:convert';
import 'dart:convert' show utf8;
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';


import '../Firebase/Components/Constants.dart';
import '../Firebase/Models/all_products_screen.dart';
import '../Pages/Details_Screen.dart';
import 'Dialog.dart';



class SearchBar extends StatelessWidget {
  const SearchBar({Key key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery
        .of(context)
        .platformBrightness;
    return IconButton(
        onPressed: (){
      showSearch(
          context: context, delegate: GetStorage().read('language')==1?Search():ArabicSearch());
    }, icon:Icon(
      Icons.search
    ));
  }
}




// English Search
class Search extends SearchDelegate<Skirts>{
  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(
       onPressed:(){
         query='';
       }, icon:Icon(Icons.clear))
   ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
  return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    final latestSearch=
    foodController.skirts.where((p) => p.name.toLowerCase().contains(query)).toList();

  return ListView.builder(
    itemCount: latestSearch.length,
    itemBuilder: ( context,index) {

      return InkWell(
        onTap: (){Get.to(
            SearchDetails(
              cookStuff: latestSearch[index],)
        );},
        child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 5),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: '${latestSearch[index].image}',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.14,
                    height:
                    MediaQuery.of(context).size.width * 0.14,
                  ),
                ),
                title: Text(latestSearch[index].name),
                subtitle: Text(latestSearch[index].price.toString()),
              ),
          ),
      );
    },
  )
  ;
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final latestSearch=foodController.skirts.where((p) => p.name.toLowerCase().contains(query)).toList();
    return ListView.builder(
      itemCount: query!=''?latestSearch.length:0,
      itemBuilder: ( context,index) {

        return InkWell(
          onTap: (){Get.to(
              SearchDetails(
                cookStuff: latestSearch[index],)
          );},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 5),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: '${latestSearch[index].image}',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.14,
                  height:
                  MediaQuery.of(context).size.width * 0.14,
                ),
              ),
              title: Text(GetStorage().read('language')==1?
              latestSearch[index].name:latestSearch[index].arabic),
              subtitle: Text(r'$'+latestSearch[index].price.toString()),
            ),
          ),
        );
      },
    );
  }
}




class ArabicSearch extends SearchDelegate<Skirts>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed:(){
            query='';
          }, icon:Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    final latestSearch=
    foodController.skirts.where((p) => p.arabic.contains(query)).toList();

    return ListView.builder(
    itemCount: latestSearch.length,
    itemBuilder: ( context,index) {

    return InkWell(
    onTap: (){Get.to(
    SearchDetails(
    cookStuff: latestSearch[index],)
    );},
    child: Padding(
    padding: const EdgeInsets.only(bottom: 16.0, left: 5),
    child: ListTile(
    leading: ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: CachedNetworkImage(
    imageUrl: '${latestSearch[index].image}',
    fit: BoxFit.cover,
    width: MediaQuery.of(context).size.width * 0.14,
    height:
    MediaQuery.of(context).size.width * 0.14,
    ),
    ),
    title: Text(latestSearch[index].name),
    subtitle: Text(latestSearch[index].price.toString()),
    ),
    ),
    );
    },
    )
    ;
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final latestSearch=foodController.skirts.where((p) => p.name.toLowerCase().contains(query)).toList();
    return ListView.builder(
      itemCount: query!=''?latestSearch.length:0,
      itemBuilder: ( context,index) {

        return InkWell(
          onTap: (){Get.to(
              SearchDetails(
                cookStuff: latestSearch[index],)
          );},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 5),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: '${latestSearch[index].image}',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.14,
                  height:
                  MediaQuery.of(context).size.width * 0.14,
                ),
              ),
              title: Text(GetStorage().read('language')==1?
              latestSearch[index].name:latestSearch[index].arabic),
              subtitle: Text(r'$'+latestSearch[index].price.toString()),
            ),
          ),
        );
      },
    )
    ;
  }
}