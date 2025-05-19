import 'package:ecommerce/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce/view/auth/register_view.dart';
import 'package:ecommerce/view/widget/custom_button2.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text_form_fild.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
          ),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CusomText(
                      text: 'Welcome',
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(RegisterScreen());
                      },
                      child: const CusomText(
                        text: 'Sign Up',
                        //color: primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const CusomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  // color: Colors.grey,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextFormFild(
                  onsave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  text: 'Email',
                  hint: 'user@gmail.com',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormFild(
                  onsave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  text: 'password',
                  hint: '**********',
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // // const CusomText(
                // //   text: 'Forgot Password?',
                // //   fontSize: 14,
                // //   alignment: Alignment.topRight,
                // // ),
                // const SizedBox(
                //   height: 20,
                // ),
                const SizedBox(
                  height: 45,
                ),
                CustomButton2(
                  text: 'SIGN IN',
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const CusomText(
                //   text: '--OR--',
                //   alignment: Alignment.center,
                //   fontSize: 14,
                // ),
                // const SizedBox(
                //   height: 40,
                // ),
                // CustomSocialButon(
                //   onPress: () {
                //     controller.googleSignInMethod();
                //   },
                //   image: 'assets/images/Google.png',
                //   text: 'Sign In with Google',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
