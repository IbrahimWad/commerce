import 'package:bottom_animation/source/bottomnav_item.dart';
import 'package:bottom_animation/source/navigation_bar.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/auth/login_secreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/viewmodel/auth_view_model.dart';
import '../core/viewmodel/controle_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return box.read('user') == null
        ? LoginScreen()
        : GetBuilder<ControlViewModel>(
            builder: (controller) => Scaffold(
              body: controller.currentScreen,
              bottomNavigationBar: bottomNavigationBar(),
            ),
          );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
        builder: (controller) => BottomAnimation(
              hoverAlignmentDuration: 600,
              activeIconColor: Colors.white,
              backgroundColor: primaryColor,
              deActiveIconColor: primaryColor,
              itemHoverColor: const Color(0xFF696969),
              barHeight: 58,
              items: [
                BottomNavItem(
                    title: 'Home',
                    widget: const Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
                BottomNavItem(
                  title: 'Bag',
                  widget: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                  iconData: Icons.home,
                ),
                BottomNavItem(
                    title: 'Profile',
                    widget: const Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
              ],
              barRadius: 40,
              onItemSelect: (int value) {
                controller.changeSelectedValue(value);
              },
              selectedIndex: controller.navigatorValue,
            ));
  }
}
