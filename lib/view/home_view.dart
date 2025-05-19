import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/viewmodel/home_view_model.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/Post_View.dart';
import 'package:ecommerce/view/details_view.dart';
import 'package:ecommerce/view/product_view.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder: ((controller) => controller.loadding.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xE0000000),
                elevation: 0,
                centerTitle: true,
                title: const CusomText(
                  alignment: Alignment.center,
                  text: "eBazzar",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),

                  //  text: box.read('username'),
                ),
              ),
              floatingActionButton: Container(
                height: 60,
                width: 60,
                //s  alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    alignment: Alignment.center,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      //fill: 0.5,
                      size: 40,
                    ),
                    onPressed: () {
                      // controller.getLocation();
                      Get.to(const PostView());
                    }),
              ),
              body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  //  shrinkWrap: true,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 20, 1, 20),
                        //height: 25,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black54),
                        child: const CusomText(
                          text: 'Categories',
                          // fon,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          alignment: Alignment.center,
                          fontSize: 21,
                        ),
                      ),
                      _listViewCategories(context),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 1, 1, 10),
                        //height: 25,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black54),
                        child: const CusomText(
                          text: 'All Product',
                          // fon,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          alignment: Alignment.center,
                          fontSize: 21,
                        ),
                      ),
                      // SizedBox(
                      //   height: 0,
                      // ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: _listViewProducts(context)),
                    ],
                  )),
            )),
    );
  }

  Widget _listViewProducts(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: ((controller) => Container(
            // height: Get,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 20, // Space between columns
                mainAxisSpacing: 30, // Space between rows
              ),
              //scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              //padding: EdgeInsets.symmetric(vertical: 15),
              itemCount: controller.productModel.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white70.withAlpha(20)),
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  child: GestureDetector(
                    onTap: () {
                      box.write('uid', controller.productModel[index].uid);
                      Get.to(DetailsView(
                        productModel: controller.productModel[index],
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          //width: Get.width * 0.2,
                          height: 120,
                          width: Get.width * 0.6,
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              controller.productModel[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: Get.height * 0.03,
                        // ),
                        //marginSymmetric(vertical: 0),
                        const SizedBox(
                          height: 15,
                        ),
                        CusomText(
                          text: controller.productModel[index].name,
                          fontSize: 13,
                          alignment: Alignment.center,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }

  Widget _listViewCategories(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        // height: Get.height * 0.5,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: Get.width * 0.45,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: MediaQuery.of(context).size.width * .02,
            mainAxisSpacing: MediaQuery.of(context).size.height * .01,
          ),
          //scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),

          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF1E1E1E)),
              child: GestureDetector(
                onTap: () {
                  box.write('name', controller.categoryModel[index].name);
                  print(controller.categoryModel[index].name);
                  Get.to(const ProductView());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 1),
                      width: 75,
                      height: 75,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child:
                          Image.network(controller.categoryModel[index].image),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    CusomText(
                      text: controller.categoryModel[index].name,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//   Widget _searchTextFormField() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey.shade400,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TextFormField(
//         cursorColor: Colors.black,
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//           prefixIcon: Icon(
//             Icons.search,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
}
