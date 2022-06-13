class CartProductModel {
  String? name;
  String? image;
  int? quantity;
  String? price;
  String? productId;
  CartProductModel(
      {this.name, this.image, this.quantity, this.price, this.productId});
  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return CartProductModel();
    } else {
      return CartProductModel(
        name: json['name'],
        image: json['image'],
        quantity: json['quantity'],
        price: json['price'],
        productId: json['productId'],
      );
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "quantity": quantity,
      "price": price,
      "productId": productId,
    };
  }
}
