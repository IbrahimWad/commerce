import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/product_model.dart';
import '../services/product_service.dart';

class ProductViewModel extends GetxController {
  ValueNotifier<bool> get loadding => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  ProductViewModel() {
    getProduct();
  }

  getProduct() async {
    _loading.value = true;
    await ProductService().getProduct().then((value) {
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
}
