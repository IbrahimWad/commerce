class UserModel {
  late String userId, email, name, pic;

  UserModel({
    required this.email,
    required this.name,
    required this.pic,
    required this.userId,
  });

  UserModel.fromeJson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
