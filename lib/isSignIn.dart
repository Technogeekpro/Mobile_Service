import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile_service/controller/auth_controller.dart';
import 'package:mobile_service/view/home_screen.dart';
import 'package:mobile_service/view/signin.dart';

class IsSignedIn extends GetWidget<FirebaseAuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseAuthController>().user != null
          ? HomeScreen()
          : SignIn();
    });
  }
}
