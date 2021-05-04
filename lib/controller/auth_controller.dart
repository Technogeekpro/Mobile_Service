import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:mobile_service/view/home_screen.dart';
import 'package:mobile_service/view/login.dart';
import 'package:mobile_service/widget/customsnackbar.dart';

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
      "name": name,
      "email": email,
      "role": role,
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) => Get.offAll(SignIn()));
    }).catchError((onError) => customsnackbar(onError.message));
  }

  void detailSubmit(
    String brand,
    String series,
    String model,
    String imei,
  ) async {
    CollectionReference submit = FirebaseFirestore.instance.collection('users');
    String uid = _auth.currentUser.uid.toString();

    Map<String, String> mobileDetails = {
      'brand': brand,
      'series': series,
      'model': model,
      'imei': imei,
      'uid': uid,
    };
    await submit
        .doc('1')
        .collection('mobiledetails')
        .add(mobileDetails)
        .then((value) => print('added'))
        .onError((error, stackTrace) => print('failed'));
  }

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  void googleSign() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    await _auth
        .signInWithCredential(credential)
        .then((value) => Get.offAll(HomeScreen()));
  }

  void logout() async =>
      await _auth.signOut().then((value) => Get.offAll(SignIn()));

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.to(HomeScreen()))
        .catchError((onError) => customsnackbar(onError.message));
  }

  void sendpasswordresetemail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(SignIn());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError(
        (onError) => Get.snackbar("Error In Email Reset", onError.message));
  }
}
