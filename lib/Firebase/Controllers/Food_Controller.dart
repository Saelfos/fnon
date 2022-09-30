
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../Pages/shopping_cart_screen.dart';
import '../Components/Constants.dart';
import '../Models/all_products_screen.dart';
import '../Models/order_model.dart';







class FoodController extends GetxController {

  final snackBar1 = const SnackBar(content: Text('Please fill all fields'),);
  final snackBar2 = const SnackBar(content: Text('Added Successfully'),);
  final snackBar3 = const SnackBar(content: Text('Deleted Order'),);

  static FoodController instance = Get.find();
  RxList<Featured> allProducts = RxList<Featured>([]);
  RxList<Featured> featured = RxList<Featured>([]);
  RxList<BestSellers> bestSellers = RxList<BestSellers>([]);
  RxList<Discount> discount = RxList<Discount>([]);
  RxList<NewArrival> newArrival = RxList<NewArrival>([]);
  RxList<Skirts> skirts = RxList<Skirts>([]);
  RxList<Blouse> blouse = RxList<Blouse>([]);
  RxList<Dress> dress = RxList<Dress>([]);
  RxList<Kettle> kettle = RxList<Kettle>([]);
  RxList<Bags> bags = RxList<Bags>([]);
  RxList<Jacket> jacket = RxList<Jacket>([]);
  RxList<Trousers> trousers = RxList<Trousers>([]);
  RxList<Boots> boots = RxList<Boots>([]);
  RxList<LongJacket> longJacket = RxList<LongJacket>([]);
  RxList<Granite> granite = RxList<Granite>([]);
  RxList<GranitePlus> granitePlus = RxList<GranitePlus>([]);
  RxList<Nouval> nouval = RxList<Nouval>([]);
  RxList<LovelyHearts> lovelyHearts = RxList<LovelyHearts>([]);
  RxList<TurkishProducts> turkishProducts = RxList<TurkishProducts>([]);
  RxList<TimeLess> timeLess = RxList<TimeLess>([]);
  RxList<OrdersModel> orders = RxList<OrdersModel>([]);
  RxList<ClientOrderModel> orderList = RxList<ClientOrderModel>([]);
  // Rx<ClientOrderModel> myOrderModel = ClientOrderModel().obs;

  String collection = "Products";

//Text Controller
  TextEditingController name = TextEditingController();
  TextEditingController arabicName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController size= TextEditingController();
  TextEditingController mainId = TextEditingController();
  TextEditingController categoryId = TextEditingController();
  TextEditingController subCategoryId = TextEditingController();
  TextEditingController nonStickId = TextEditingController();


  // final CollectionReference _foodReference =
  // FirebaseFirestore.instance.collection('Food');

  @override
  onReady() {
    super.onReady();
    featured.bindStream(getFeatured());
    bestSellers.bindStream(getBestSellers());
    discount.bindStream(getDiscount());
    newArrival.bindStream(getNewArrival());
    skirts.bindStream(getSkirts());
    trousers.bindStream(getTrousers());
    boots.bindStream(getBoots());
    longJacket.bindStream(getLongJacket());
    blouse.bindStream(getBlouse());
    jacket.bindStream(getJacket());
    dress.bindStream(getDress());
    bags.bindStream(getBags());
    kettle.bindStream(getKettle());

    granite.bindStream(getGranite());
    granitePlus.bindStream(getGranitePlus());
    nouval.bindStream(getNouval());
    lovelyHearts.bindStream(getLovelyHearts());
    turkishProducts.bindStream(getTurkishProducts());
    timeLess.bindStream(getTimeLess());
    orders.bindStream(getOrders());
allProducts.bindStream(getAllProducts());
// myOrderModel.bindStream(getOneOrder());
orderList.bindStream(getOneOrder());
    // print(foodController.mealsModel.value.id);
  }


//Get All Products
  Stream<List<Featured>> getAllProducts() =>
      firebaseFirestore.collection(collection)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Featured.fromMap(item.data())).toList()
      );






//Get Featured
  Stream<List<Featured>> getFeatured() =>
      firebaseFirestore.collection(collection)
          .where("mainId", isEqualTo: 1)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Featured.fromMap(item.data())).toList()
      );

  //Get BestSellers
  Stream<List<BestSellers>> getBestSellers() =>
      firebaseFirestore.collection(collection)
          .where("mainId", isEqualTo: 2)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => BestSellers.fromMap(item.data())).toList());

//Get Discount
  Stream<List<Discount>> getDiscount() =>
      firebaseFirestore.collection(collection)
          .where("mainId", isEqualTo: 3)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Discount.fromMap(item.data())).toList());

//Get NewArrival
  Stream<List<NewArrival>> getNewArrival() =>
      firebaseFirestore.collection(collection)
          .where("mainId", isEqualTo: 4)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => NewArrival.fromMap(item.data())).toList());

  //Get Skirts
  Stream<List<Skirts>> getSkirts() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 1)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Skirts.fromMap(item.data())).toList());

  //Get Blouses
  Stream<List<Blouse>> getBlouse() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 2)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Blouse.fromMap(item.data())).toList());



  Stream<List<Trousers>> getTrousers() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 3)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Trousers.fromMap(item.data())).toList());

  Stream<List<Dress>> getDress() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 4)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Dress.fromMap(item.data())).toList());

  Stream<List<LongJacket>> getLongJacket() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 5)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => LongJacket.fromMap(item.data())).toList());

  Stream<List<Jacket>> getJacket() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 6)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Jacket.fromMap(item.data())).toList());

  Stream<List<Boots>> getBoots() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 7)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Boots.fromMap(item.data())).toList());

  Stream<List<Bags>> getBags() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 8)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Bags.fromMap(item.data())).toList());



  Stream<List<Kettle>> getKettle() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 9)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Kettle.fromMap(item.data())).toList());





  Stream<List<Granite>> getGranite() =>
      firebaseFirestore.collection(collection)
          .where("categoryId", isEqualTo: 10)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Granite.fromMap(item.data())).toList());

  Stream<List<GranitePlus>> getGranitePlus() =>
      firebaseFirestore.collection(collection)
          .where("nonStickId", isEqualTo: 2)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => GranitePlus.fromMap(item.data())).toList());

  Stream<List<Nouval>> getNouval() =>
      firebaseFirestore.collection(collection)
          .where("nonStickId", isEqualTo: 3)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => Nouval.fromMap(item.data())).toList());

  Stream<List<LovelyHearts>> getLovelyHearts() =>
      firebaseFirestore.collection(collection)
          .where("nonStickId", isEqualTo: 4)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => LovelyHearts.fromMap(item.data())).toList());

  Stream<List<TurkishProducts>> getTurkishProducts() =>
      firebaseFirestore.collection(collection)
          .where("nonStickId", isEqualTo: 5)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => TurkishProducts.fromMap(item.data()))
              .toList());

  Stream<List<TimeLess>> getTimeLess() =>
      firebaseFirestore.collection(collection)
          .where("nonStickId", isEqualTo: 6)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => TimeLess.fromMap(item.data())).toList());

  Stream<List<OrdersModel>> getOrders() =>
      firebaseFirestore.collection('orders').orderBy('date',descending: false)
          .snapshots()
          .map((query) =>
          query.docs.map((item) => OrdersModel.fromMap(item.data())).toList()
      );
  Stream<List<ClientOrderModel>> getOneOrder() =>
      firebaseFirestore.collection('orders').where('clientName',isEqualTo: GetStorage().read('clientName'))
          .snapshots()
          .map((query) =>
          query.docs.map((item) => ClientOrderModel.fromMap(item.data())).toList()
      );





  // Stream<ClientOrderModel> getOneOrder() => firebaseFirestore
  //     .collection('orders')
  //     .doc(GetStorage().read('clientName'))
  //     .snapshots()
  //     .map((snapshot) => ClientOrderModel.fromSnapshot(snapshot));

  // File _imageFile;
  //
  //


  addProductToFirestore(value) {
    firebaseFirestore.collection(collection).doc(name.text).set({
      "name": name.text.trim(),
      "arabic": arabicName.text.trim(),
      "mainId": int.parse(mainId.text),
      "categoryId": int.parse(categoryId.text),
      "price": int.parse(price.text),
      "size":size.text,
      "date": Timestamp.now(),
      "likes": 0,
      "image": value,
    },
        _clearControllers()
    ).then((value) {ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar2));});

  }

  _clearControllers() {
    name.clear();
    arabicName.clear();
    price.clear();
    mainId.clear();
    categoryId.clear();
    subCategoryId.clear();
    nonStickId.clear();
    size.clear();
  }

  TextEditingController clientName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController detailedLocation = TextEditingController();

  addOrder(List<ShoppingCartModel> shoppingCartList)  {
       firebaseFirestore.collection('orders').doc(clientName.text).set({
         "clientName": clientName.text.trim(),
         "phoneNumber": int.parse(phoneNumber.text),
         "location": location.text,
         "detailedLocation": detailedLocation.text,
         "date": Timestamp.now(),
         "order": shoppingCartList.map((e) => e.toJson()).toList(),


    },
           _clearControllers2()
    ).then((value) => ScaffoldMessenger.of(Get.context).showSnackBar((foodController.snackBar2)))
          ;

    }
    _clearControllers2() {
      clientName.clear();
      phoneNumber.clear();
      location.clear();
      detailedLocation.clear();
    }
  }











//
//   getLatest() async {
//     _foodReference.orderBy('date', descending: true).get().then((value) {
//       for (
//       int i = 0; i < value.docs.length; i++) {
//         latest.add(LatestModel.fromJson(value.docs[i].data()));
//       }
//     });
//   }
// }

    // var pizza= List<Pizza>.empty().obs;
    // var salad= List<Salad>.empty().obs;


// FoodController(){
//   // getCategory1();
//   getCategory2();
//   getCategory3();
//   getCategory4();
//
//
// }
//
// // getCategory1() async{
// //   _foodReference.where('id',isEqualTo: 1).get().then((value){
// //     for(
// //     int i =0; i< value.docs.length; i++){
// //       meals.add(Meals.fromJson(value.docs[i].data()));
// //     }
// //   });
// //   }
//   getCategory2() async {
//     _foodReference.where('id',isEqualTo: 2).get().then((value) {
//       for (
//       int i = 0; i < value.docs.length; i++) {
//         sandwiches.add(Sandwiches.fromJson(value.docs[i].data()));
//         print(sandwiches.length);
//       }
//     }
//     );
//   }
//
//     getCategory3() async{
//     _foodReference.where('id',isEqualTo: 3).get().then((value) {
//       for (
//       int i = 0; i < value.docs.length; i++) {
//         salad.add(Salad.fromJson(value.docs[i].data()));
//         print(salad.length);
//       }
//     }
//     );
//     }
//     getCategory4() async {
//       _foodReference.where('id',isEqualTo: 4).get().then((value) {
//         for (
//         int i = 0; i < value.docs.length; i++) {
//           pizza.add(Pizza.fromJson(value.docs[i].data()));
//           print(pizza.length);
//         }
//       }
//
//   );
// }

//       }
//
//   );
// }
// }


// final CollectionReference _sandwichReference =
//     FirebaseFirestore.instance.collection('Sandwiches');
//
// final CollectionReference _saladReference =
//     FirebaseFirestore.instance.collection('Salad');
//
// final CollectionReference _pizzaReference =
//     FirebaseFirestore.instance.collection('Pizza');
