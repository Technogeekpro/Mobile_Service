import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/widget/colors.dart';
import 'package:mobile_service/widget/proceed_details.dart';

class ProceedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.primaryColor,
          elevation: 0,
        ),
        backgroundColor: CustomColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Google Pixel 2XL",
                          style: GoogleFonts.poppins(
                              color: CustomColor.secondaryColor),
                        ),
                        Text(
                          '256 GB | IMEI: xcxcxcxcxcxcx00',
                          style: GoogleFonts.poppins(
                              color: CustomColor.secondaryColor),
                        )
                      ],
                    ),
                    Icon(
                      Icons.phone,
                      color: CustomColor.secondaryColor,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/proceed');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: CustomColor.secondaryColor,
                          primary: CustomColor.primaryColor,
                          // padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                        ),
                        child: Text('Submit',
                            style: GoogleFonts.poppins(
                              color: CustomColor.primaryColor,
                            ))),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ProceedDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
