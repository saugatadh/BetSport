import 'package:betipl/controller/usercontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:betipl/models/user.dart';
import 'package:betipl/models/database.dart';
import 'package:betipl/Screens/front_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value;


  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name,String phoneno, String email, String password,) async {
    try {
      final _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
        String token ;
        await FirebaseMessaging().getToken().then((value) => token = value);
        FirebaseFirestore.instance.collection('tokens').doc(name).set({
          'token': token,
        });
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
        phoneNo: phoneno,
        win: 0,
        lose: 0,
        currentbalance: 0,
        token: token,
        post: 'client',  
      );

      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        
      }
      if (Get.find<AuthController>().user?.uid != null) {
          return Get.to(FrontPage());
        } 
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    }
  }

  void login(String email, String password) async {
    try {CircularProgressIndicator();
      final  _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
                    if (Get.find<AuthController>().user?.uid != null) {
                   
                      Get.to(FrontPage());
                    }
         
  
        
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
// https://github.com/tadaspetra/getx_examples/blob/master/todo_app/lib/controllers