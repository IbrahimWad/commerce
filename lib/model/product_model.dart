import 'package:flutter/cupertino.dart';

class ProductModel {
  late String name, image, description, category, phone;
  var uid;
  late int id;

  late int price;
  ProductModel(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.category,
      required this.uid,
      required this.id,
      required this.phone});

  ProductModel.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    category = map['category'] ?? '';
    description = map['description'] ?? '';
    image = map['image'] ?? '';
    name = map['name'] ?? '';
    price = map['price'] ?? 0;
    uid = map['uid'] ?? '';
    id = map['id'] ?? '';
    phone = map['phone'] ?? '';
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'category': category,
      'uid': uid,
      'id': id,
      'phone': phone,
    };
  }
}
