import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/viewmodel/profile_viewmodel.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/Post_View.dart';
import 'package:ecommerce/view/TheOrder.dart';
import 'package:ecommerce/view/my_product_view.dart';
import 'package:ecommerce/view/widget/custom_button.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(20.0), // Set the border radius
                      bottomRight: Radius.circular(20.0),
                    )),
                child: AppBar(
                  toolbarHeight: 100,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: CusomText(
                    alignment: Alignment.centerLeft,
                    text: "${box.read('user')}",
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  centerTitle: true,
                  actions: [
                    Container(
                      height: 50,
                      margin:
                          const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // color: color3,
                      ),
                      child: TextButton(
                          onPressed: () {
                            controller.signout();
                          },
                          child: const Row(
                            children: [
                              CusomText(
                                text: 'Sign out',
                                alignment: Alignment.center,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 60,
                    child: CustomButton(
                      color: color2,
                      onPressed: () {
                        Get.to(const PostView());
                      },
                      text: 'Add Product',
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    height: 60,
                    child: CustomButton(
                      onPressed: () {
                        Get.to(() => const MyProductView());
                      },
                      text: 'My Product',
                      color: color2,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    height: 60,
                    child: CustomButton(
                      color: color2,
                      text: 'Incoming Orders',
                      onPressed: () {
                        Get.to(
                          () => TheOrder(),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    height: 60,
                    child: CustomButton(
                      color: color2,
                      text: 'Sign out',
                      onPressed: () {
                        controller.signout();
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    height: 60,
                    child: CustomButton(
                      color: color2,
                      text: 'About us',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
