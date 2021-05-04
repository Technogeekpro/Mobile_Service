import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/widget/colors.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    Text(
                      "xaxaxaxax xaxaxaxa xaxaxaxax\nxaxaxaxax xaxaxaxa ",
                      style: GoogleFonts.poppins(
                          color: CustomColor.secondaryColor),
                    )
                  ],
                ),
                Image(
                    height: 50,
                    width: 50,
                    image: NetworkImage(
                        "https://images-na.ssl-images-amazon.com/images/I/81AqwYyZjzL._AC_SL1500_.jpg"))
              ],
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: CustomColor.secondaryColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Cost & Charges",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'xcxcxcxcxcx..........',
                      style: GoogleFonts.poppins(
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    Text(
                      '0000',
                      style: GoogleFonts.poppins(
                        color: CustomColor.secondaryColor,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'xcxcxcxcxcx..........',
                      style: GoogleFonts.poppins(
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    Text(
                      '0000',
                      style: GoogleFonts.poppins(
                        color: CustomColor.secondaryColor,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'xcxcxcxcxcx..........',
                      style: GoogleFonts.poppins(
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    Text(
                      '0000',
                      style: GoogleFonts.poppins(
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                  ],
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: CustomColor.secondaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TOTAL :',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    Text(
                      '0000',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () {
                    //razor pay api
                    Get.defaultDialog(
                        backgroundColor: CustomColor.secondaryColor,
                        radius: 10,
                        title: 'Confirmation',
                        titleStyle: GoogleFonts.poppins(),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularProgressIndicator.adaptive(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  CustomColor.secondaryColor),
                              backgroundColor: CustomColor.primaryColor,
                              strokeWidth: 1,
                            ),
                            Text('Checkout Progress',
                                style: GoogleFonts.poppins(
                                  color: CustomColor.primaryColor,
                                )),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: CustomColor.primaryColor,
                                primary: CustomColor.primaryColor,
                                padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                              ),
                              child: Text('Exit',
                                  style: GoogleFonts.poppins(
                                    color: CustomColor.secondaryColor,
                                    fontSize: 20,
                                  ))),
                        ]);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: CustomColor.secondaryColor,
                    primary: CustomColor.primaryColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                  child: Text('Checkout',
                      style: GoogleFonts.poppins(
                        color: CustomColor.primaryColor,
                        fontSize: 20,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
