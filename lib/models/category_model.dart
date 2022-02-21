class CategoryModel {
  String name, image;

  CategoryModel({required this.name, required this.image});

  fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
