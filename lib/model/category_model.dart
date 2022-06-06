class CategoryModel {
  String? name;
  String? image;
  CategoryModel({this.name, this.image});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return CategoryModel();
    } else {
      return CategoryModel(name: json['name'], image: json['image']);
    }
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
