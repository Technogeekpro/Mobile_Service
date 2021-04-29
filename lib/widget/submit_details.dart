import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/view/proceed_screen.dart';
import 'package:mobile_service/widget/colors.dart';
import 'package:mobile_service/widget/proceed_details.dart';

class SubmitDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
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
                onPressed: () {
                  Get.to(ProceedScreen());
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
