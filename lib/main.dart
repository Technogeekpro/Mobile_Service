import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:mobile_service/binding/authBinding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_service/isSignIn.dart';
import 'package:mobile_service/view/home_screen.dart';

import 'package:mobile_service/view/register.dart';
import 'package:mobile_service/view/proceed_screen.dart';
import 'package:mobile_service/view/checkout_screen.dart';

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
      home: IsSignedIn(),
      routes: {
        '/signin': (cotext) => SignUp(),
        '/home': (context) => HomeScreen(),
        '/proceed': (context) => ProceedScreen(),
        '/checkout': (context) => CheckOut()
      },
    );
  }
}
