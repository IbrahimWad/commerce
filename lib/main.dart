import 'package:ecommerce/helper/binding.dart';
import 'package:ecommerce/view/auth/login_secreen.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: box.read('user') == null ? LoginScreen() : ControlView(),
      theme: ThemeData.dark(),
    );
  }
}
//fontFamily: 'SourceCodePro-Regular'
// mvvm --> model View ViewModel
// firebase as backend
// Get x the statemangment

// model is the layir that holding the data of the user like password and email
// view is the ui
// ViewModel is linked between the model and viewmodel

// State mangment
// getBuilder -- notreactive
// Get x   -- reactive  -- Stream
// Obx -- reactive
