// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'header_and_body_screen.dart';
//
//
//
//
// class SubCategories extends StatelessWidget {
//   SubCategories({Key key, this.categoryId, this.subCategoryId,}) : super(key: key);
//   final int categoryId;
//   final int subCategoryId;
//
//   @override
//   Widget build(BuildContext context) {
//     var brightness = MediaQuery.of(context).platformBrightness;
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: brightness == Brightness.light ? Colors.white: Colors.grey.shade900,
//       appBar:  AppBar(
//         elevation: 0,
//         iconTheme: IconThemeData(
//             color: brightness == Brightness.light
//                 ? Color.fromRGBO(0,66,154,1):Colors.white70),
//         backgroundColor: brightness == Brightness.light
//             ? Colors.white
//             : Colors.grey.shade900,
//         title: Text(
//           categoryId==5?'Electronics'.tr:
//          categoryId==6?'Cook Stuff'.tr:'Non-Stick'.tr,
//           style: TextStyle(
//               color: brightness == Brightness.light
//                   ? Color.fromRGBO(0,66,154,1):Colors.white70),
//         ),
//       ),
//       body:
//       categoryId==5?
// //Electronics
//       ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         children: [
//           Header(subCategoryId: 1),
//           ListBuilder(subCategoryId: 1),
//           Header(subCategoryId: 2),
//           ListBuilder(subCategoryId: 2),
//           Header(subCategoryId: 3),
//           ListBuilder(subCategoryId: 3),
//           Header(subCategoryId:4),
//           ListBuilder(subCategoryId: 4),
//         ],
//       )
//           :
//       //CookStuff
// categoryId==6?
//       ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         children: [
//           Header(subCategoryId: 5),
//           ListBuilder(subCategoryId: 5),
//           Header(subCategoryId: 6),
//           ListBuilder(subCategoryId: 6),
//           Header(subCategoryId: 7),
//           ListBuilder(subCategoryId: 7),
//
//         ],
//       ):
// //NonStickCategories
// ListView(
//   shrinkWrap: true,
//   physics: BouncingScrollPhysics(),
//   children: [
//
//     Header(nonStickId: 1),
//     ListBuilder(nonStickId: 1),
//     Header(nonStickId: 2),
//     ListBuilder(nonStickId: 2),
//     Header(nonStickId: 3),
//     ListBuilder(nonStickId: 3),
//     Header(nonStickId: 4),
//     ListBuilder(nonStickId:4),
//     Header(nonStickId: 5),
//     ListBuilder(nonStickId: 5),
//     Header(nonStickId: 6),
//     ListBuilder(nonStickId: 6),
//
//   ],
// )
//       ,
//     );
//   }
// }