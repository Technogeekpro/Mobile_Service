import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/widget/colors.dart';

showLoading() {
  Get.defaultDialog(
      backgroundColor: CustomColor.secondaryColor,
      radius: 10,
      titleStyle: GoogleFonts.poppins(),
      title: "Loading",
      content: SpinKitSpinningCircle(
        color: CustomColor.primaryColor,
      ));
}
