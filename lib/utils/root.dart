import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_service/controller/auth_controller.dart';
import 'package:mobile_service/controller/userController.dart';
import 'package:mobile_service/view/home_screen.dart';
import 'package:mobile_service/view/login.dart';

class Root extends GetWidget<FirebaseAuthController> {
  @override
  Widget build(BuildContext context) {
    print("Root funcntion called ...");
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        print("Value from server" +
                Get.find<FirebaseAuthController>().user?.uid !=
            null);
        if (Get.find<FirebaseAuthController>().user?.uid != null) {
          return HomeScreen();
        } else {
          return SignIn();
        }
      },
    );
  }
}
