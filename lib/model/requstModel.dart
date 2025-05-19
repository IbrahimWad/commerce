import 'package:get/get_connect/http/src/request/request.dart';

class RequestProductMOdel {
  late String name, image, phone;
  late int quantity, price;
  late String uid;
  late double lat, lang;
  RequestProductMOdel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.uid,
    required this.lang,
    required this.lat,
    required this.phone,
  });

  RequestProductMOdel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    uid = map['uid'];
    lat = map['lat'];
    lang = map['lang'];
    phone = map['phone'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'uid': uid,
      'lat': lat,
      'lang': lang,
      'phone': phone,
    };
  }
}
