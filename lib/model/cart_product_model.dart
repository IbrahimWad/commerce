class CartProductModel {
  late String name, image, phone;
  late int quantity, price;
  late String uid;
  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.uid,
    required this.phone,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    uid = map['uid'];
    phone = map['phone'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'uid': uid,
      'phone': phone,
    };
  }
}
