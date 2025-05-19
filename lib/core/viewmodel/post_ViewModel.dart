import 'dart:io';
import 'dart:math';

import 'package:ecommerce/core/services/post_service.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

final random = Random();

class PostViewModel extends GetxController {
  TextEditingController textEditingControllername = TextEditingController();
  TextEditingController textEditingControllersalary = TextEditingController();
  TextEditingController textEditingControllerdescription =
      TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();

  PlatformFile? file;
  FilePickerResult? result;
  var selectedOption = '';
  var items = [
    'Electronics',
    'Laptops',
    'Mobile',
    'Storage',
    'Accessories',
    'Computers',
  ];

  bool isloading = false;

  void onOptionChanged(String value) {
    selectedOption = value;

    print(selectedOption);
    update();
  }

// Generate a random integer between 10000 and 99999
  // final randomInt = random.nextInt(90000) + 10000;
  final randomInt = 10000 + random.nextInt(90000);

  void Imagepicker() async {
    result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null) {
      file = result!.files.first;
    }
    update();
  }

  sendRequst() async {
    if (selectedOption == '' ||
        textEditingControllerdescription.value.text == '' ||
        textEditingControllername.value.text == '' ||
        textEditingControllersalary.value.text == '' ||
        textEditingControllerPhone.value.text == '' ||
        result == null ||
        file == null) {
      print('canoot post');
    } else {
      isloading = true;

      if (isloading == true) {
        Get.defaultDialog(
            contentPadding: const EdgeInsets.all(10),
            barrierDismissible: false,
            backgroundColor: Colors.white.withOpacity(0.4),
            title: 'Please wait',
            content: const CircularProgressIndicator(
              color: primaryColor,
            ));
      }
      // print('post');
      // print(textEditingControllerdescription.value.text);

      print(file!.name);
      print(file!.path);

      var refStorage = FirebaseStorage.instance.ref('Products/${file!.name}');
      await refStorage.putFile(File(file!.path!));
      var url = await refStorage.getDownloadURL();
      print('URL : $url');

      box.write('phone', textEditingControllerPhone.value.text);

      FireStoreProduct().addProductToFireStore(ProductModel(
          id: randomInt,
          name: textEditingControllername.value.text,
          description: textEditingControllerdescription.value.text,
          image: url,
          price: int.parse(textEditingControllersalary.value.text),
          category: selectedOption,
          phone: textEditingControllerPhone.value.text,
          uid: box.read('user')));

      // file!.path = File('');
      update();
      isloading = false;

      if (isloading == false) {
        Get.back();
      }
      Get.snackbar('Alret', 'data has been added succsfully');
    }
    // isloading = false;

    // if (isloading == false) {
    //   Get.back();
    // }
  }

  @override
  void onInit() {
    textEditingControllername;
    textEditingControllersalary;
    textEditingControllerdescription;
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllername.dispose();
    textEditingControllersalary.dispose();
    textEditingControllerdescription.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
