import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/view/widget/custom_button.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatelessWidget {
  late ProductModel productModel;
  DetailsView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        //  title: CusomText(text: 'Back'),
        backgroundColor: const Color(0xD20C0C0C),
        leading: IconButton(
          //padding: EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              //height: Get.height * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Container(
                //color: Colors.amber,
                //height: Get.height * 0.4,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    productModel.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: const Color(0xFFDEDEDE),
              ),
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: CusomText(
                text: productModel.name,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 27,
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: const Color(0xFF1A1A1A),
              ),
              //height: Get.height * 0.25,
              child: SingleChildScrollView(
                child: CusomText(
                  text: productModel.description,
                  color: Colors.white,
                  fontSize: 20,
                  alignment: Alignment.centerLeft,
                  height: 1.4,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Expanded(

              //color: color4,
              // padding: EdgeInsets.only(top: Get.height * 0.15),

              // width: Get.width * 0.4,
              child: Container(
            // alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  // width: 150,
                  // alignment: Alignment.center,
                  // padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0x52239682),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: IconButton(
                        icon: const Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (await canLaunch(
                              "https://wa.me/+964${productModel.phone}")) {
                            await launch("https://wa.me/${productModel.phone}");
                          } else {
                            launch("tel://${productModel.phone}");
                          }

                          //await launch("https://wa.me/${productModel.phone}");
                        },
                        color: const Color(0x52239682)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //color: Color(0x52239682),
                  ),
                  // margin: EdgeInsets.fromLTRB(1, 1, 40, 20),
                  //alignment: Alignment.centerLeft,
                  child: CusomText(
                    alignment: Alignment.centerLeft,
                    text: 'Price ${productModel.price}\$',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

                //alignment: Alignment.centerLeft,

                Container(
                  //width: 145,
                  //  margin: EdgeInsets.fromLTRB(1, 1, 45, 20),
                  alignment: Alignment.centerLeft,

                  child: GetBuilder<CartViewModel>(
                    builder: (controller) {
                      return CustomButton(
                          color: const Color(0x52239682),
                          text: 'Add to Cart',
                          onPressed: () {
                            controller.addProduct(
                              CartProductModel(
                                name: productModel.name,
                                image: productModel.image,
                                price: productModel.price,
                                quantity: 1,
                                uid: box.read('user'),
                                phone: productModel.phone,
                              ),
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
