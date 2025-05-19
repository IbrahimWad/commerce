import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/view/widget/custom_button2.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 170,
                    height: 57,
                    // alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: color2, borderRadius: BorderRadius.circular(40)),
                    child: CusomText(
                      text: 'total: ${controller.total}\$',
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    //s  alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: color2, borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        alignment: Alignment.center,
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          //fill: 0.5,
                          size: 40,
                        ),
                        onPressed: () {
                          controller.getLocation();
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    //s  alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: color2, borderRadius: BorderRadius.circular(30)),

                    child: IconButton(
                      alignment: Alignment.center,
                      icon: const Icon(
                        Icons.shopping_basket,
                        color: Colors.white,

                        //fill: 0.5,
                        size: 40,
                      ),
                      onPressed: () {
                        //controller.delete();

                        if (controller.lang == 0 && controller.lat == 0) {
                          print('Give us your location');
                        } else {
                          controller.sendRequst();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.cartProductModel.length,
                    itemBuilder: (context, index) {
                      return Stack(
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
                                    color: Colors.black54,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 25),
                                          blurRadius: 25,
                                          color: Colors.black26)
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
                                        controller
                                            .cartProductModel[index].image,
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
                                              .cartProductModel[index].name,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Container(
                                          height: 30,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 10),
                                          decoration: BoxDecoration(
                                              color: color5,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: CusomText(
                                            alignment: Alignment.center,
                                            text:
                                                '${controller.cartProductModel[index].price}\$',
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            // vertical: 20,
                                          ),
                                          child: CustomButton2(
                                            text: 'delete',
                                            color: Colors.red,
                                            onPressed: () {
                                              controller.deleteRow(
                                                controller
                                                    .cartProductModel[index]
                                                    .image,
                                                index,
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
