class ProductModel {
  String? name, description, price, color, size, image;

  ProductModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.size,
      required this.image});

  ProductModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    description = map['description'];
    price = map['price'];
    color = map['color'];
    size = map['size'];
    image = map['image'];
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'size': size,
      'image': image,
    };
  }
}
