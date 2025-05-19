import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/main.dart';

class ProductService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _collectionReference
        .where('category', isEqualTo: box.read('name'))
        .get();
    return value.docs;
  }
}
