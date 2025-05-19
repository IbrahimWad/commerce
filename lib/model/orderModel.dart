class OrderModel {
  late String name, image, uid, phone;
  late double lang, lat;

  late int price;
  OrderModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.lang,
      required this.lat,
      required this.uid,
      required this.phone});

  OrderModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    price = map['price'];
    lat = map['lat'];
    lang = map['lang'];
    uid = map['uid'];
    phone = map['phone'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'lat': lat,
      'price': price,
      'lang': lang,
      'uid': uid,
      'phone': phone,
    };
  }
}
