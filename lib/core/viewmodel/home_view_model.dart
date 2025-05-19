import 'package:ecommerce/core/services/home_service.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loadding => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _categoryModel.add(CategoryModel.fromJson(
                  value[i].data() as Map<String, dynamic>)),
              _loading.value = false,
            },
          update(),
        });
  }

  Future<void> getBestSellingProducts() async {
    _loading.value = true;
    try {
      var value = await HomeService().getProduct();
      _productModel
          .clear(); // clear the existing list before adding new products
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      _loading.value = false;
      update();
    } catch (e) {
      // handle any errors that occur
      print('Error getting products: $e');
      _loading.value = false;
    }
  }

  @override
  void onInit() {
    getCategory();
    getBestSellingProducts();
    super.onInit();
  }

  // HomeViewModel() {
  //   getBestSellingProducts();
  // }
}
