import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/viewmodel/productViewModel.dart';
import 'package:ecommerce/view/widget/HomeBody.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<ProductViewModel>(
          init: ProductViewModel(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                //toolbarHeight: 70,
                elevation: 0,
                centerTitle: true,
                backgroundColor: primaryColor,

                title: CusomText(
                  text: box.read('name'),
                  fontSize: 20,
                  alignment: Alignment.center,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              body: const HomeBody(),
            );
          }),
    );
  }
}
