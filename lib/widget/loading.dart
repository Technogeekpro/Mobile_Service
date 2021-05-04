import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/widget/colors.dart';

showLoading() {
  Get.defaultDialog(
      backgroundColor: CustomColor.secondaryColor,
      radius: 10,
      titleStyle: GoogleFonts.poppins(),
      title: "Loading",
      content: CircularProgressIndicator.adaptive(
        valueColor:
            new AlwaysStoppedAnimation<Color>(CustomColor.secondaryColor),
        backgroundColor: CustomColor.primaryColor,
        strokeWidth: 1,
      ));
}
