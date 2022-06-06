import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("categories");
  final CollectionReference _collectionReferenceProduct =
      FirebaseFirestore.instance.collection("Product");
  Future<List<QueryDocumentSnapshot>> getCategories() async {
    return await _collectionReference.get().then((value) => value.docs);
  }

  Future<List<QueryDocumentSnapshot>> getProductsBestSelling() async {
    return await _collectionReferenceProduct.get().then((value) => value.docs);
  }
}
