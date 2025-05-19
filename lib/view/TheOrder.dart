import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/viewmodel/order_viewModel.dart';
import 'package:ecommerce/view/widget/custom_button.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TheOrder extends StatelessWidget {
  const TheOrder({super.key});

  // final OrderViewModel controller = Get.put(OrderViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xE0000000),
          elevation: 0,
          centerTitle: true,
          title: const CusomText(
            alignment: Alignment.center,
            text: "Incoming Orders",
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),

            //  text: box.read('username'),
          ),
        ),
        // backgroundColor: Colors.white,
        body: GetBuilder<OrderViewModel>(
            init: OrderViewModel(),
            builder: (controller) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.orderModel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.launchGoogleMaps(
                          controller.orderModel[index].lat,
                          controller.orderModel[index].lang);
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                                      controller.orderModel[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: SizedBox(
                                  //height: 136,
                                  width: Get.width - 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CusomText(
                                        alignment: Alignment.center,
                                        text: controller.orderModel[index].name,
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
                                              '${controller.orderModel[index].price}\$',
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 25,
                                          // vertical: 20,
                                        ),
                                        child: CustomButton(
                                          text: 'delete',
                                          color: Colors.red,
                                          onPressed: () {
                                            controller.deleteDocumnt(
                                                controller
                                                    .orderModel[index].image,
                                                index);
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: CusomText(
                                          text: controller
                                              .orderModel[index].phone,
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
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
