import 'package:ecommerce/core/viewmodel/my_product_ViewModel.dart';
import 'package:ecommerce/view/widget/custom_button3.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductView extends StatelessWidget {
  const MyProductView({super.key});

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
              text: "my product",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),

              //  text: box.read('username'),
            ),
          ),
          body: GetBuilder<MyProductViewModel>(
            init: MyProductViewModel(),
            builder: (controller) {
              return Container(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.productModel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // box.write('uid', controller.productModel[index].uid);
                        // Get.to(DetailsView(
                        //   productModel: controller.productModel[index],
                        // ));
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
                                    color: Colors.white38,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 25),
                                          blurRadius: 25,
                                          color: Colors.black87)
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 7,
                                  left: 4,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 1),
                                    height: 140,
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
                                    left: 180,
                                    top: 5,
                                    child: SizedBox(
                                      height: 180,
                                      width: Get.width - 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 0),
                                            child: CusomText(
                                              //alignment: Alignment.center,
                                              text: controller
                                                  .productModel[index].name,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white70,
                                              fontSize: 17,
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: CusomText(
                                              alignment: Alignment.center,
                                              text:
                                                  '${controller.productModel[index].price}\$',
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              // vertical: 20,
                                            ),
                                            child: CustomButton3(
                                              text: 'delete',
                                              color: Colors.redAccent,
                                              onPressed: () {
                                                controller.deleteDocumnt(
                                                    controller
                                                        .productModel[index]
                                                        .image,
                                                    index);
                                              },
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
              );
            },
          )),
    );
  }
}
