import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Pages/shopping_cart_screen.dart';




class OrdersModel {
  String location;
  String clientName;
  String detailedLocation;
  int phoneNumber;
  List<ShoppingCartModel> order;


  static const LOCATION = "location";
  static const CLIENTNAME = "clientName";
  static const DETAILEDLOCATION = "detailedLocation";
  static const ORDER = "order";
  static const PHONENUMBER ="phoneNumber";

  OrdersModel({this.location, this.clientName, this.detailedLocation, this.order,this.phoneNumber});


  OrdersModel.fromMap(Map<dynamic, dynamic> data){
    location = data[LOCATION];
    detailedLocation = data[DETAILEDLOCATION];
    clientName = data[CLIENTNAME];
    phoneNumber = data[PHONENUMBER];
    order = _convertCartItems((data)[ORDER] ?? []);
  }


  List<ShoppingCartModel> _convertCartItems(List cartList){
    List<ShoppingCartModel> result = [];
    if(cartList.length > 0){
      cartList.forEach((element) {
        result.add(ShoppingCartModel.fromJson(element));
      });
    }
    return result;
  }
}

class ClientOrderModel {
  String location;
  String clientName;
  String detailedLocation;
  int phoneNumber;
  List<ShoppingCartModel> order;


  static const LOCATION = "location";
  static const CLIENTNAME = "clientName";
  static const DETAILEDLOCATION = "detailedLocation";
  static const ORDER = "order";
  static const PHONENUMBER ="phoneNumber";

  ClientOrderModel({this.location, this.clientName, this.detailedLocation, this.order,this.phoneNumber});


  ClientOrderModel.fromMap(Map<dynamic, dynamic> data){
    location = data[LOCATION];
    detailedLocation = data[DETAILEDLOCATION];
    clientName = data[CLIENTNAME];
    phoneNumber = data[PHONENUMBER];
    order = _convertCartItems((data)[ORDER] ?? []);
  }

  // ClientOrderModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   clientName = (snapshot.data() as dynamic) [CLIENTNAME];
  //   phoneNumber = (snapshot.data() as dynamic)[PHONENUMBER];
  //   location = (snapshot.data()as dynamic)[LOCATION];
  //   detailedLocation=(snapshot.data()as dynamic)[DETAILEDLOCATION];
  //   order = _convertCartItems((snapshot.data()as dynamic)[ORDER] ?? []);
  // }
  List<ShoppingCartModel> _convertCartItems(List cartList){
    List<ShoppingCartModel> result = [];
    if(cartList.length > 0){
      cartList.forEach((element) {
        result.add(ShoppingCartModel.fromJson(element));
      });
    }
    return result;
  }
}