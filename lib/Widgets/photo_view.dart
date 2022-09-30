import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../Firebase/Models/all_products_screen.dart';
import '../Pages/Favorites_Screen.dart';
import '../Pages/shopping_cart_screen.dart';

class PhotoViewPage extends StatelessWidget {
  PhotoViewPage({Key key,this.bestSellers,this.cookStuff,this.discount,
    this.electronics,this.favoriteItem,this.featured,this.newArrival,this.shoppingCartItem, this.image }) : super(key: key);

  FavoritesModel favoriteItem;
  ShoppingCartModel shoppingCartItem;
  Blouse electronics;
  Featured featured;
  BestSellers bestSellers;
  Discount discount;
  NewArrival newArrival;
  Skirts cookStuff;
  String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PhotoView(

      imageProvider: CachedNetworkImageProvider(image),
      minScale:(size.height*0.0006),
      maxScale: (size.height*0.0009),
    );
  }
}
