import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FireStoreUserService {
  // Create a CollectionReference called users that references the firestore collection
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("User");
  Future<void> addUserFireStore(UserModel userModel) async {
    // Call the user's CollectionReference to add a new user
    return await _collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
