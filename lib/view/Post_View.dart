import 'dart:io';

import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/viewmodel/post_ViewModel.dart';
import 'package:ecommerce/view/widget/custom_button.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:ecommerce/view/widget/textFormFiledCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: GetBuilder<PostViewModel>(
            init: PostViewModel(),
            builder: (controller) {
              return ListView(
                children: [
                  TextFormFiledCustom(
                    hint: 'name',
                    textEditingController: controller.textEditingControllername,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('hello');
                      controller.Imagepicker();
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0x6E0A0A0A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: controller.result == null
                          ? Container(
                              child: const Center(
                                child: Icon(Icons.add_a_photo),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(controller.file!.path!),
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  // DropdownButton(
                  //   // Initial Value
                  //   value: controller.dropdownvalue,

                  //   // Down Arrow Icon
                  //   icon: const Icon(Icons.keyboard_arrow_down),

                  //   // Array list of items
                  //   items: controller.items.map((String items) {
                  //     return DropdownMenuItem(
                  //       value: items,
                  //       child: Text(items),
                  //     );
                  //   }).toList(),
                  //   // After selecting the desired option,it will
                  //   // change button value to selected value
                  //   onChanged: (newValue) {
                  //     controller.dropdownvalue = '$newValue';
                  //   },
                  // ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                      //underline: BorderSide(color: primaryColor,),
                      isExpanded: true,
                      alignment: Alignment.center,
                      hint: const CusomText(
                        text: 'Choos a Category',
                        alignment: Alignment.centerLeft,
                        fontSize: 14,
                      ),
                      value: controller.selectedOption == ''
                          ? null
                          : controller.selectedOption,
                      items: controller.items
                          .map((e) => DropdownMenuItem(
                              // alignment: AlignmentDirectional.topStart,
                              value: e,
                              alignment: AlignmentDirectional.center,
                              child: CusomText(
                                text: e,
                                //fontWeight: FontWeight.normal,
                                alignment: Alignment.center,
                              )))
                          .toList(),
                      onChanged: (value) {
                        controller.onOptionChanged('$value');
                      },
                    ),
                    // onChanged: (value) =>
                    //     controller.onOptionChanged('$value'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormFiledCustom(
                    keybordType: TextInputType.number,
                    hint: 'Sallary in Dollar',
                    textEditingController:
                        controller.textEditingControllersalary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormFiledCustom(
                    keybordType: TextInputType.number,
                    hint: 'Phone Number',
                    textEditingController:
                        controller.textEditingControllerPhone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0x6E0A0A0A)),
                    child: TextFormFiledCustom(
                      keybordType: TextInputType.multiline,
                      hint: 'Description',
                      textEditingController:
                          controller.textEditingControllerdescription,
                      maxLines: 7,
                      color: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'Send Post',
                    onPressed: () {
                      controller.sendRequst();
                    },
                    color: primaryColor,
                  )
                ],
              );
            }),
      ),
    );
  }
}
