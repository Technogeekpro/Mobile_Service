import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/controller/auth_controller.dart';

class SocialSignWidgetRow extends GetWidget<FirebaseAuthController> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          controller.googleSign();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            width: 30,
            image: AssetImage('assets/google.png'),
          ),
          Text('Login with Google', style: GoogleFonts.poppins())
        ]));
  }
}
