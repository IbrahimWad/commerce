import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';

class FireStoreProduct {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<void> addProductToFireStore(ProductModel productModel) async {
    return await _userCollectionRef
        .doc("${productModel.id}")
        .set(productModel.toJson());
  }
}
