import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/services/order_service.dart';
import 'package:ecommerce/model/orderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderViewModel extends GetxController {
  ValueNotifier<bool> get loadding => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<OrderModel> get orderModel => _oroductModel;
  final List<OrderModel> _oroductModel = [];

  getProduct() async {
    _loading.value = true;
    await OrderService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _oroductModel
            .add(OrderModel.fromJson(value[i].data() as Map<String, dynamic>));

        _loading.value = false;
        print(orderModel[i].name);
      }
      print(jsonEncode(orderModel));
    });
    update();
  }

  void launchGoogleMaps(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  deleteDocumnt(name, int index) async {
    FirebaseFirestore.instance
        .collection("order")
        .where("image", isEqualTo: name)
        .get()
        .then((value) {
      for (var element in value.docs) {
        FirebaseFirestore.instance
            .collection("order")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      }
    });
    _oroductModel.removeAt(index);
    update();
  }

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }
}
