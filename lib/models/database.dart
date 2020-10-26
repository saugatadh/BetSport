import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:betipl/models/user.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "userId": user.id,
        "phoneNo":user.phoneNo,
        "win": user.win,
        "lose":user.lose,
        "balance":user.currentbalance,
        "token": user.token,
        "post": user.post,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}