import 'package:ecommerce/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce/core/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/core/viewmodel/controle_view_model.dart';
import 'package:ecommerce/core/viewmodel/home_view_model.dart';
import 'package:ecommerce/core/viewmodel/my_product_ViewModel.dart';
import 'package:ecommerce/core/viewmodel/post_ViewModel.dart';
import 'package:ecommerce/core/viewmodel/profile_viewmodel.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => ControlViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => CartViewModel(), fenix: true);
    Get.lazyPut(() => ProfileViewModel(), fenix: true);
    Get.lazyPut(() => MyProductViewModel(), fenix: true);
    Get.lazyPut(() => PostViewModel(), fenix: true);
  }
}
