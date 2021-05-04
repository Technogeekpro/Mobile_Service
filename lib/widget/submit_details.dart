import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/controller/auth_controller.dart';

import 'package:mobile_service/widget/colors.dart';

// ignore: must_be_immutable
class SubmitDetails extends GetWidget<FirebaseAuthController> {
  TextEditingController brand = new TextEditingController();
  TextEditingController series = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController imei = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: brand,
                cursorColor: CustomColor.secondaryColor,
                autocorrect: true,
                decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide:
                          new BorderSide(color: CustomColor.secondaryColor)),
                  labelText: 'Brand',
                  labelStyle: TextStyle(color: CustomColor.secondaryColor),
                ),
                style: GoogleFonts.poppins(color: CustomColor.secondaryColor)),
            TextField(
                controller: series,
                cursorColor: CustomColor.secondaryColor,
                decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide:
                          new BorderSide(color: CustomColor.secondaryColor)),
                  labelText: 'Series',
                  labelStyle: TextStyle(color: CustomColor.secondaryColor),
                ),
                style: GoogleFonts.poppins(color: CustomColor.secondaryColor)),
            TextField(
                controller: model,
                cursorColor: CustomColor.secondaryColor,
                decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide:
                          new BorderSide(color: CustomColor.secondaryColor)),
                  labelText: 'Model',
                  labelStyle: TextStyle(color: CustomColor.secondaryColor),
                ),
                style: GoogleFonts.poppins(color: CustomColor.secondaryColor)),
            TextField(
                controller: imei,
                cursorColor: CustomColor.secondaryColor,
                decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide:
                          new BorderSide(color: CustomColor.secondaryColor)),
                  labelText: 'IMEI/Series No',
                  labelStyle: TextStyle(color: CustomColor.secondaryColor),
                ),
                style: GoogleFonts.poppins(color: CustomColor.secondaryColor)),
            SizedBox(height: 40),
            TextButton(
                onPressed: () async {
                  controller.detailSubmit(
                      brand.text, series.text, model.text, imei.text);
                },
                style: TextButton.styleFrom(
                  backgroundColor: CustomColor.secondaryColor,
                  primary: CustomColor.primaryColor,
                  padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                ),
                child: Text('Submit',
                    style: GoogleFonts.poppins(
                      color: CustomColor.primaryColor,
                      fontSize: 20,
                    ))),
          ],
        ),
      ),
    );
  }
}
