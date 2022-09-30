class CartItem {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const MEALS_ID = "mealsId";
  static const INGREDIENTS = "ingredients";
  static const STEPS = "steps";



  String image;
  String name;
  String arabic;
  String quantity;
  int cost;
  int mealsId;
  int price;
  List ingredients;
  List steps;



  CartItem({this.mealsId, this.image, this.name, this.quantity, this.cost,this.steps,this.ingredients,this.arabic});

  CartItem.fromMap(Map<dynamic, dynamic> data){
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    quantity = data[QUANTITY];
    cost = data[COST];
    mealsId = data[MEALS_ID];
    price = data[PRICE];
ingredients = data[INGREDIENTS];
steps = data[STEPS];




  }

  Map toJson() => {
    MEALS_ID: mealsId,
    IMAGE: image,
    NAME: name,
    ARABIC:arabic,
    QUANTITY: quantity,
    COST: price ,
    PRICE: price,
    INGREDIENTS:ingredients,
    STEPS:steps
  };

}