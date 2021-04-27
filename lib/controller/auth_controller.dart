import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mobile_service/controller/userController.dart';
import 'package:mobile_service/services/database.dart';

import 'package:flutter/material.dart';

class FirebaseAuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>(null);

  User get user => _firebaseUser.value;

  @override
  void onInit() {

    super.onInit();
    _firebaseUser.bindStream(auth.authStateChanges());
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.put(UserController()).user =
      await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
          colorText: Colors.white
      );
    }
  }

}