import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/controller/auth_controller.dart';
import 'package:mobile_service/view/home_screen.dart';
import 'package:mobile_service/view/signup.dart';
import 'package:mobile_service/widget/colors.dart';

// ignore: must_be_immutable
class SignIn extends GetWidget<FirebaseAuthController> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        title: Text('SignIn',
            style: GoogleFonts.poppins(color: CustomColor.secondaryColor)),
      ),
      backgroundColor: CustomColor.primaryColor,
      body: Stack(children: <Widget>[
        SvgPicture.asset(
          'assets/back.svg',
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          padding: EdgeInsets.all(50),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                      controller: emailController,
                      cursorColor: CustomColor.secondaryColor,
                      decoration: InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: CustomColor.secondaryColor)),
                          labelText: 'Email or Phone',
                          labelStyle:
                              TextStyle(color: CustomColor.secondaryColor),
                          suffixIcon: Icon(
                            Icons.person,
                            color: CustomColor.secondaryColor,
                            size: 15,
                          )),
                      style: GoogleFonts.poppins(color: Colors.white)),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: passwordController,
                      obscureText: true,
                      cursorColor: CustomColor.secondaryColor,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: CustomColor.secondaryColor)),
                          labelStyle:
                              TextStyle(color: CustomColor.secondaryColor),
                          suffixIcon: Icon(
                            Icons.lock,
                            color: CustomColor.secondaryColor,
                            size: 15,
                          )),
                      style: GoogleFonts.poppins(
                          color: CustomColor.secondaryColor)),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(height: 50),
                  TextButton(
                      onPressed: () async {
                        // controller.login(
                        //     emailController.text, passwordController.text);
                        Get.to(HomeScreen());
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: CustomColor.secondaryColor,
                        primary: CustomColor.primaryColor,
                        padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                      child: Text('Login',
                          style: GoogleFonts.poppins(
                            color: CustomColor.primaryColor,
                            fontSize: 20,
                          ))),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: TextButton(
                      onPressed: () async {
                        // controller.login(
                        //     emailController.text, passwordController.text);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        primary: Colors.redAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            width: 20,
                          ),
                          Text('Google Login',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 10,
                              )),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I am new user',
                            style: GoogleFonts.poppins(
                              color: CustomColor.secondaryColor,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            child: Text("Sign Up",
                                style: GoogleFonts.poppins(
                                    color: CustomColor.secondaryColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold)),
                            onTap: () {
                              Get.to(SignUp());
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
