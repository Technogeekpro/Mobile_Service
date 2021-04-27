import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_service/view/signin.dart';
import 'package:mobile_service/widget/colors.dart';

class SignUp extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _checkPassword() {
    if (cpassword.text == password.text) {
      return true;
    }
    return false;
  }

  void _regsisterUser(String _email, String _password) async {
    if (_checkPassword()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        title: Text(
          'Sign up',
          style: GoogleFonts.poppins(color: CustomColor.secondaryColor),
        ),
      ),
      body: Stack(children: [
        SvgPicture.asset('assets/back.svg',
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            width: 700,
            height: 700),
        Center(
          child: Container(
            padding: EdgeInsets.all(50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                      controller: email,
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
                      style: GoogleFonts.poppins(
                          color: CustomColor.secondaryColor)),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: password,
                      obscureText: true,
                      cursorColor: CustomColor.secondaryColor,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: CustomColor.secondaryColor)),
                          focusColor: CustomColor.secondaryColor,
                          labelStyle:
                              TextStyle(color: CustomColor.secondaryColor),
                          suffixIcon: Icon(
                            Icons.lock_open_outlined,
                            color: CustomColor.secondaryColor,
                            size: 15,
                          )),
                      style: GoogleFonts.poppins(
                          color: CustomColor.secondaryColor)),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    

                      controller: cpassword,
                      obscureText: true,
                      cursorColor: CustomColor.secondaryColor,

                      decoration: InputDecoration(

                          labelText: 'Confirm Password',
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: CustomColor.secondaryColor)),
                          focusColor: CustomColor.secondaryColor,
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
                  FlatButton(
                    onPressed: () {
                      _regsisterUser(email.text, password.text);
                    },
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: CustomColor.secondaryColor,
                    child: Text('Sign Up',
                        style: GoogleFonts.poppins(
                          color: CustomColor.primaryColor,
                          fontSize: 20,
                        )),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have account',
                            style: GoogleFonts.poppins(
                              color: CustomColor.secondaryColor,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            child: Text("Log In",
                                style: GoogleFonts.poppins(
                                    color: CustomColor.secondaryColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold)),
                            onTap: () {
                              Get.offAll(SignIn());
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
