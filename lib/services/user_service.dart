import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_day/models/user.dart';

class UserService {
  final String uid;

  UserService({required this.uid});

  final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  //Create new record of User in Collection
  Future registerUserOnCollection(CustomUser user) async {
    return await databaseReference.collection("users").doc(uid).set({
      "id": uid,
      "apparmentNumber": user.apparmentNumber,
      "name": user.name,
      "email": user.email
    });
  }
}
