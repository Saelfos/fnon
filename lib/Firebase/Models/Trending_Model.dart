class Trending {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ARABIC='arabic';
  static const PRICE = "price";
  static const INGREDIENTS = "ingredients";
  static const STEPS = "steps";

  int id;
  String image;
  String name;
  String arabic;
  List ingredients;
  List steps;
  int price;

 Trending(
      {this.id, this.image, this.name, this.steps, this.ingredients, this.price,this.arabic});

 Trending.fromMap(Map<dynamic, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    arabic=data[ARABIC];
    ingredients = data[INGREDIENTS];
    steps = data[STEPS];
    price = data[PRICE];
  }
}