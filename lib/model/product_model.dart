import 'package:ecommerce_app/helper/extantion.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name;
  String? image;
  String? description;
  Color? color;
  String? size;
  String? price;
  String? productId;
  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price,
      this.productId});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return ProductModel();
    } else {
      return ProductModel(
        name: json['name'],
        image: json['image'],
        description: json['description'],
        color: HexColor.fromHex(json['color']),
        size: json['size'],
        price: json['price'],
        productId: json['productId'],
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
      "productId": productId,
    };
  }
}
