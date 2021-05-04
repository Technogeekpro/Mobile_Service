import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:mobile_service/view/home_screen.dart';
import 'package:mobile_service/view/login.dart';
import 'package:mobile_service/view/proceed_screen.dart';
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
    DocumentReference reference =
        FirebaseFirestore.instance.collection("users").doc(email);
    String role = "users";

    Map<String, String> userdata = {
      "name": name,
      "email": email,
      "role": role,
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await reference.set(userdata).then((value) => Get.offAll(SignIn()));
    }).catchError((onError) => customsnackbar(onError.message));
  }

  void mobiledetails(
    String brand,
    String series,
    String model,
    String imei,
  ) async {
    String email = _auth.currentUser.email.toString();
    String uid = _auth.currentUser.uid.toString();
    DocumentReference submit =
        FirebaseFirestore.instance.collection('users').doc(email);

    String device = "Mobile";
    Map<String, String> mobileDetails = {
      'Device': device,
      'brand': brand,
      'series': series,
      'model': model,
      'imei': imei,
      'uid': uid,
    };

    await submit
        .collection('Mobile_Details')
        .add(mobileDetails)
        .then((value) => Get.to(ProceedScreen(), arguments: brand))
        .onError((error, stackTrace) => customsnackbar(error.message));
  }

  void desktopdetails(
    String brand,
    String series,
    String model,
    String imei,
  ) async {
    String email = _auth.currentUser.email.toString();
    String uid = _auth.currentUser.uid.toString();
    DocumentReference submit =
        FirebaseFirestore.instance.collection('users').doc(email);

    String device = "Desktop";
    Map<String, String> mobileDetails = {
      'Device': device,
      'brand': brand,
      'series': series,
      'model': model,
      'imei': imei,
      'uid': uid,
    };

    await submit
        .collection('Desktop_Details')
        .add(mobileDetails)
        .then((value) => Get.to(ProceedScreen(), arguments: brand))
        .onError((error, stackTrace) => customsnackbar(error.message));
  }

  void tabletdetails(
    String brand,
    String series,
    String model,
    String imei,
  ) async {
    String email = _auth.currentUser.email.toString();
    String uid = _auth.currentUser.uid.toString();
    DocumentReference submit =
        FirebaseFirestore.instance.collection('users').doc(email);

    String device = "Tablet";
    Map<String, String> mobileDetails = {
      'Device': device,
      'brand': brand,
      'series': series,
      'model': model,
      'imei': imei,
      'uid': uid,
    };

    await submit
        .collection('Tablet_Details')
        .add(mobileDetails)
        .then((value) => Get.to(ProceedScreen(), arguments: brand))
        .onError((error, stackTrace) => customsnackbar(error.message));
  }

  void laptopdetails(
    String brand,
    String series,
    String model,
    String imei,
  ) async {
    String email = _auth.currentUser.email.toString();
    String uid = _auth.currentUser.uid.toString();
    DocumentReference submit =
        FirebaseFirestore.instance.collection('users').doc(email);

    String device = 'Laptop';
    Map<String, String> laptopDetails = {
      'Device': device,
      'brand': brand,
      'series': series,
      'model': model,
      'imei': imei,
      'uid': uid,
    };

    await submit
        .collection('Laptop_Details')
        .add(laptopDetails)
        .then((value) => Get.to(ProceedScreen(), arguments: brand))
        .onError((error, stackTrace) => customsnackbar(error.message));
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
