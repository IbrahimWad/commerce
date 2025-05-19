import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/main.dart';

class MyProductService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _collectionReference
        .where('uid', isEqualTo: box.read('user'))
        .get();
    return value.docs;
  }
}
