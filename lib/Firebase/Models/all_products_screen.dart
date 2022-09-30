

class Featured{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const LIKES= 'likes';
  static const SIZE= 'size';

  int id;
  String image;
  String name;
  String arabic;
  String size;
  int price;
  int likes;

  Featured({ this.id,this.image, this.name, this.price,this.likes, this.arabic,this.size});

  Featured.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    likes =data[LIKES];
    size=data[SIZE];

    }
  }



class BestSellers{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';

  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;
  BestSellers({this.id, this.image, this.name, this.price,this.arabic,this.size});

  BestSellers.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}
class Discount{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


  Discount({this.id, this.image, this.name, this.price,this.arabic,this.size});

  Discount.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }



}
class NewArrival{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';

  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


  NewArrival({this.id, this.image, this.name, this.price,this.arabic,this.size});

  NewArrival.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}

class Skirts{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';

  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


 Skirts({this.id, this.image, this.name,  this.price,this.arabic,this.size});

 Skirts.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}
class Blouse{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC="arabic";
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


  Blouse({this.id, this.image, this.name, this.price,this.arabic,this.size});

  Blouse.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}
class Trousers{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


 Trousers({this.id, this.image, this.name,  this.price,this.arabic,this.size});

 Trousers.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}

class Dress{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


  Dress({this.id, this.image, this.name, this.price,this.arabic,this.size});

  Dress.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}

class LongJacket{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


 LongJacket({this.id, this.image, this.name,  this.price,this.arabic,this.size});

 LongJacket.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}
class Jacket{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


  Jacket({this.id, this.image, this.name, this.price,this.arabic,this.size});

  Jacket.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}
class Boots{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


 Boots({this.id, this.image, this.name,  this.price,this.arabic,this.size});

 Boots.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}
class Bags{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const SIZE= 'size';


  int id;
  String image;
  String name;
  String arabic;
  int price;
  String size;


  Bags({this.id, this.image, this.name, this.price,this.arabic,this.size});

  Bags.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
    size=data[SIZE];
  }

}




























class Kettle{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";

  int id;
  String image;
  String name;
  String arabic;
  int price;

  Kettle({this.id, this.image, this.name, this.price,this.arabic});

  Kettle.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
  }

}

class Granite{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";

  int id;
  String image;
  String name;
  String arabic;
  int price;

  Granite({this.id, this.image, this.name, this.price,this.arabic});

  Granite.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
  }

}

class GranitePlus{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";

  int id;
  String image;
  String name;
  String arabic;
  int price;

  GranitePlus({this.id, this.image, this.name, this.price,this.arabic});

  GranitePlus.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
  }

}

class Nouval{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";

  int id;
  String image;
  String name;
  String arabic;
  int price;

  Nouval({this.id, this.image, this.name, this.price,this.arabic});

  Nouval.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
  }

}


class LovelyHearts{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";

  int id;
  String image;
  String name;
  String arabic;
  int price;

  LovelyHearts({this.id, this.image, this.name, this.price,this.arabic});

  LovelyHearts.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
  }

}

class TurkishProducts{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";

  int id;
  String image;
  String name;
  String arabic;
  int price;

  TurkishProducts({this.id, this.image, this.name, this.price,this.arabic});

  TurkishProducts.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
  }

}
class TimeLess{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";

  int id;
  String image;
  String name;
  String arabic;
  int price;

  TimeLess({this.id, this.image, this.name, this.price,this.arabic});

  TimeLess.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    price = data[PRICE];
  }

}




// class Meals{
//
//   int id;
//   String image;
//   String name;
//   String price;
//   String ingredients;
//   String steps ;
//   Meals({this.id, this.image, this.name, this.price, this.ingredients , this.steps});
//
//   Meals.fromJson(Map<dynamic, dynamic> map){
//     if (map == null) {
//       return;
//     }
//     id = map['id'];
//     image = map['image'];
//     name = map['name'];
//     price = map['price'];
//
//   }
//   toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'price': price,
//
//     };
//   }
//
// }


//
// class Sandwiches{
//
//   int id;
//   String image;
//   String name;
//   String price;
//   String ingredients;
//   String steps ;
//
//   Sandwiches({this.id, this.image, this.name, this.price, this.steps, this.ingredients});
//
//   Sandwiches.fromJson(Map<dynamic, dynamic> map){
//     if (map == null) {
//       return;
//     }
//     id = map['id'];
//     image = map['image'];
//     name = map['name'];
//     price = map['price'].toString();
//     ingredients = map['ingredients'];
//     steps = map['steps'];
//   }
//   toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'price': price,
//       'ingredients': ingredients,
//       'steps': steps,
//     };
//   }
//
// }
// class Pizza{
//
//   int id;
//   String image;
//   String name;
//   String price;
//   String ingredients;
//   String steps ;
//   Pizza({this.id, this.image, this.name, this.price,this.ingredients, this.steps});
//
//   Pizza.fromJson(Map<dynamic, dynamic> map){
//     if (map == null) {
//       return;
//     }
//     id = map['id'];
//     image = map['image'];
//     name = map['name'];
//     price = map['price'].toString();
//     ingredients = map['ingredients'];
//     steps = map['steps'];
//   }
//   toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'price': price,
//       'ingredients': ingredients,
//       'steps': steps,
//     };
//   }
//
// }
// class Salad{
//
//   int id;
//   String image;
//   String name;
//   String price;
//   String ingredients;
//   String steps ;
//   Salad({this.id, this.image, this.name, this.price,this.steps, this.ingredients});
//
//   Salad.fromJson(Map<dynamic, dynamic> map){
//     if (map == null) {
//       return;
//     }
//     id = map['id'];
//     image = map['image'];
//     name = map['name'];
//     price = map['price'].toString();
//     ingredients = map['ingredients'];
//     steps = map['steps'];
//   }
//   toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'price': price,
//       'ingredients': ingredients,
//       'steps': steps,
//     };
//   }
//
// }