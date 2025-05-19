import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/services/database/cart_Database_helper.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/model/requstModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class CartViewModel extends GetxController {
  ValueNotifier<bool> get looading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double? _lang = 0;
  double? _lat = 0;
  get lang => _lang;
  get lat => _lat;

  final RxInt _total = 0.obs;
  get total => _total;

  addProduct(CartProductModel cartProductModel) async {
    try {
      var dbHelper = CartDataBaseHelper.db;
      await dbHelper.insert(cartProductModel);
      Get.snackbar('Alert', 'The data has been successfully added to cart');
    } catch (e) {
      print(e);
    }

    update();
  }

  getAllProduct() async {
    _loading.value = true;
    try {
      var dbHelper = CartDataBaseHelper.db;
      _cartProductModel = await dbHelper.getAllProduct();

      print(jsonEncode(_cartProductModel));

      var respon = jsonEncode(_cartProductModel);

      for (var i = 0; i < cartProductModel.length; i++) {
        _total.value = _total.value + _cartProductModel[i].price;
      }
    } catch (e) {
      print(e);
    }
    _loading.value = false;
    // print(jsonEncode(cartProductModel));

    update();
  }

  // @override
  // void onReady() {
  //   getAllProduct();
  //   super.onReady();
  // }

  @override
  void onInit() {
    getAllProduct();
    // _initLocation();

    requestPermission();
    super.onInit();
  }

  requestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition();

    print(position.altitude);
  }

  getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location services are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('we cannoy do any thing for you');
    }
    print(Geolocator.getCurrentPosition());
    Position position = await Geolocator.getCurrentPosition();
    _lang = position.longitude;
    _lat = position.latitude;

    print(_lang);
    print(_lat);
    return await Geolocator.getCurrentPosition();
  }

  final databaseReference = FirebaseDatabase.instance.reference();
  sendRequst() async {
    print(jsonEncode(cartProductModel));
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _collectionRef = _firestore.collection('order');
    for (var i = 0; i < cartProductModel.length; i++) {
      await _collectionRef.add(RequestProductMOdel(
        image: cartProductModel[i].image,
        lat: lat,
        name: cartProductModel[i].name,
        lang: lang,
        price: cartProductModel[i].price,
        quantity: 1,
        uid: box.read('uid'),
        phone: cartProductModel[i].phone,
      ).toJson());
    }
    delete();
  
    update();
  }

  delete() {
    var dbHelper = CartDataBaseHelper.db;
    _cartProductModel = [];
    dbHelper.delete();
    _total.value = 0;
    update();
  }

  deleteRow(var image, index) {
    var dbHelper = CartDataBaseHelper.db;
    dbHelper.deleteRaw(image);
    _total.value = _total.value - cartProductModel[index].price;
    cartProductModel.removeAt(index);

    update();
  }
}
