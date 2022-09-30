class Latest {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";
  static const ARABIC='arabic';
  static const INGREDIENTS = "ingredients";
  static const STEPS = "steps";

  int id;
  String image;
  String name;
  String arabic;
  List ingredients;
  List steps;
  int price;

  Latest(
      {this.id, this.image, this.name, this.steps, this.ingredients, this.price,this.arabic});

  Latest.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    ingredients = data[INGREDIENTS];
    steps = data[STEPS];
    price = data[PRICE];
  }
}