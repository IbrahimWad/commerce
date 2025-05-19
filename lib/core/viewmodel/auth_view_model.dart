import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/services/firestore_user.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  //final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FacebookLogin _facebookLogin = FacebookLogin();
  String? email, password, name;
  bool isloading = false;

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value!.email;
  @override
  void onInit() {
    super.onInit();

    _user.bindStream(_auth.authStateChanges());
  }

  void signInWithEmailAndPassword() async {
    isloading = true;

    try {
      if (isloading == true) {
        Get.defaultDialog(
            contentPadding: const EdgeInsets.all(10),
            barrierDismissible: false,
            backgroundColor: Colors.white.withOpacity(0.4),
            title: 'Please wait',
            content: const CircularProgressIndicator(
              color: primaryColor,
            ));
      }
      await _auth.signInWithEmailAndPassword(
          email: '$email', password: '$password');
      // Get.offAll(ControlView());
      //final User user = userCredential.user!;
      //final String displayName = user.displayName ?? '';
      print('Hello $user');

      if (user == null) {
      } else {
        //  print(jsonEncode(_auth));
        print(user);
        Get.offAll(ControlView());
      }
      isloading = false;

      if (isloading == false) {
        Get.back();
      }
    } catch (e) {
      print(e);
      isloading = false;
      if (isloading == false) {
        Get.back();
      }
      Get.snackbar(
        'Error login account',
        'valid or incorrect email or password',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    box.write('user', user);
    // box.write('username', name);
  }

  void createAccountWithEmailAndPassword() async {
    try {
      isloading = true;

      if (isloading == true) {
        Get.defaultDialog(
            contentPadding: const EdgeInsets.all(10),
            barrierDismissible: false,
            backgroundColor: Colors.white.withOpacity(0.4),
            title: 'Please wait',
            content: const CircularProgressIndicator(
              color: primaryColor,
            ));
      }
      await _auth
          .createUserWithEmailAndPassword(
        email: '$email',
        password: '$password',
      )
          .then((user) async {
        saveUser(user);
      });

      isloading = false;
      if (isloading == false) {
        Get.back();
      }
      Get.snackbar('Account', 'The Account has been Created Succfully');
    } catch (e) {
      print(e);
      isloading = false;
      if (isloading == false) {
        Get.back();
      }

      Get.snackbar(
        'Error login account',
        'valid or incorrect email or password',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      email: '${user.user!.email}',
      name: name ?? '${user.user!.displayName}',
      pic: '',
      userId: user.user!.uid,
    ));
  }
}
