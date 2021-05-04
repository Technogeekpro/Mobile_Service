import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:mobile_service/widget/colors.dart';

void customsnackbar(String problem) {
  Get.snackbar("Somthing Wrong", "$problem",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: CustomColor.secondaryColor,
      icon: Icon(Ionicons.warning_outline));
}
