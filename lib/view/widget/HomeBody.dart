import 'package:ecommerce/core/viewmodel/productViewModel.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/details_view.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(builder: (controller) {
      return Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Expanded(
                child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.productModel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        box.write('uid', controller.productModel[index].uid);
                        Get.to(DetailsView(
                          productModel: controller.productModel[index],
                        ));
                      },
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            height: 190,
                            child: Stack(
                              children: [
                                Container(
                                  height: 166,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 20,
                                          color: Colors.black)
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 7,
                                  left: 4,
                                  child: SizedBox(
                                    height: 150,
                                    width: Get.width * 0.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        controller.productModel[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: SizedBox(
                                      height: 136,
                                      width: Get.width - 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CusomText(
                                            alignment: Alignment.center,
                                            text: controller
                                                .productModel[index].name,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                          Container(
                                            height: 35,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: CusomText(
                                              alignment: Alignment.center,
                                              text:
                                                  '${controller.productModel[index].price}\$',
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ))
          ],
        ),
      );
    });
  }
}
