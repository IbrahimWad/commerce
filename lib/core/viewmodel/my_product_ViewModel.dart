import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../services/my_product_service.dart';

class MyProductViewModel extends GetxController {
  ValueNotifier<bool> get loadding => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];
  getAllMyproduct() async {
    _loading.value = true;
    await MyProductService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));

        _loading.value = false;
        print(productModel[i].name);
      }
      //   print(jsonEncode(productModel));

      update();
    });
  }

  deleteDocumnt(name, int index) async {
    FirebaseFirestore.instance
        .collection("Products")
        .where("image", isEqualTo: name)
        .get()
        .then((value) {
      for (var element in value.docs) {
        FirebaseFirestore.instance
            .collection("Products")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      }
    });
    _productModel.removeAt(index);
    update();
  }

  @override
  void onInit() {
    getAllMyproduct();
    super.onInit();
  }
}
