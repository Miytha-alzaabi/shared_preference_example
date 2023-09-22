class ProductModel{
  String? name;
  String? category;
  double? price;
  String? image;

  ProductModel({this.name, this.category, this.price, this.image});

  Map<String, dynamic> toMap(){
    return {
      "name":name,
      "category":category,
      "price":price,
      "image":image

    };
  }
}