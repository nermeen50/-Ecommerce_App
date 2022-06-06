class ProductModel {
  String? name;
  String? image;
  String? description;
  String? color;
  String? size;
  String? price;
  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return ProductModel();
    } else {
      return ProductModel(
        name: json['name'],
        image: json['image'],
        description: json['description'],
        color: json['color'],
        size: json['size'],
        price: json['price'],
      );
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "description": description,
      "color": color,
      "size": size,
      "price": price,
    };
  }
}
