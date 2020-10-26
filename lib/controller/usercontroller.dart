

import 'package:get/get.dart';
import 'package:betipl/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
Future<void> updateBalannce(int subbalance, String uid)async{
    await FirebaseFirestore.instance.collection('users')
    .doc(uid)
    .update({'balance': user.currentbalance - subbalance})
    .then((value) => print("Balance Updated"))
    .catchError((error) => print("Failed to update balance: $error"));
   
}
}
