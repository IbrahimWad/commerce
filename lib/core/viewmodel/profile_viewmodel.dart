import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/auth/login_secreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value!.email;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  signout() {
    _auth.signOut();
    box.erase();

    Get.offAll(() => LoginScreen());
    update();
  }

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
  }
}
