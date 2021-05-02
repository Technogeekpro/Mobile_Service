import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:mobile_service/view/home_screen.dart';
import 'package:mobile_service/view/signin.dart';

class FirebaseAuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>(null);

  User get user => _firebaseUser.value;
  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(SignIn()));
  }

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void registerUser(
    String name,
    String email,
    String password,
  ) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("users");
    String role = "users";

    Map<String, String> userdata = {
      "Name": name,
      "Email": email,
      "Role": role,
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) => Get.offAll(SignIn()));
    }).catchError((e) => {
              if (e.code == 'weak-password')
                {
                  Get.snackbar(
                      "Something Wrong", "The password provided is too weak.")
                }
              else if (e.code == 'email-already-in-use')
                Get.snackbar("Something Wrong",
                    "The account already exists for that email.")
            });
  }

  void logout() async =>
      await _auth.signOut().then((value) => Get.offAll(SignIn()));

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(HomeScreen()))
        .catchError((e) => {
              if (e.code == 'user-not-found')
                {
                  Get.snackbar(
                      "Something Wrong", "No user found for that email.")
                }
              else if (e.code == 'wrong-password')
                {
                  Get.snackbar("Something Wrong",
                      "Wrong password provided for that user.")
                }
            });
  }
}
