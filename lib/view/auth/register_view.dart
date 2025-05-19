import 'package:ecommerce/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce/view/auth/login_secreen.dart';
import 'package:ecommerce/view/widget/custom_button2.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text_form_fild.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        leading: IconButton(
          onPressed: () {
            Get.offAll(LoginScreen());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 10,
              left: 10,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CusomText(
                        text: 'Sign Up',
                        //color: primaryColor,
                        fontSize: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFild(
                    hint: 'name',
                    text: 'Name',
                    validator: (value) {
                      if (value == null) {
                        print('name is empty');
                      }
                    },
                    onsave: (value) {
                      controller.name = value;
                    },
                  ),
                  const SizedBox(
                    height: 40,
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
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton2(
                    text: 'SIGN UP',
                    color: Colors.white,
                    onPressed: () {
                      _formkey.currentState!.save();
                      if (_formkey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
