
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'header_and_body_screen.dart';



class Sections extends StatelessWidget {
  Sections({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
                fit: BoxFit.cover,
                height: size.height*0.19,
                image: AssetImage('assets/main2.jpg')),
          ),
        ),
        Header(categoryId: 1),
        ListBuilder(categoryId:1),
        Header(categoryId: 2),
        ListBuilder(categoryId:2),
        Header(categoryId: 3),
        ListBuilder(categoryId:3),
        Header(categoryId: 4),
        ListBuilder(categoryId: 4),
        Header(categoryId: 5),
        ListBuilder(categoryId: 5),
        Header(categoryId: 6),
        ListBuilder(categoryId: 6),
        Header(categoryId: 7),
        ListBuilder(categoryId: 7),
        Header(categoryId: 8),
        ListBuilder(categoryId: 8),
      ],
    );
  }
}