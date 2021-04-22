import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:mobile_service/binding/authBinding.dart';
import 'package:mobile_service/utils/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_service/view/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      home : SignIn(),
    );
  }
}

