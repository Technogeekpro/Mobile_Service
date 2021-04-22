import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_service/widget/colors.dart';
import 'package:mobile_service/widget/submit_details.dart';
import 'package:mobile_service/widget/image_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Container(
              child: ListView(
            children: [
              ListTile(
                onTap: () {
                  Get.toNamed('/second'); //set to navigate next screen
                },
                leading: Text('Home'),
              )
            ],
          )),
        ),
      ),
      appBar: AppBar(
          backgroundColor: CustomColor.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Home',
            style: GoogleFonts.poppins(fontSize: 20),
          )),
      body: Container(
        child: Column(
          children: [
            ImageSlider(),
            Flexible(
              child: DefaultTabController(
                length: 4,
                child: Scaffold(
                  backgroundColor: CustomColor.primaryColor,
                  appBar: AppBar(
                    backgroundColor: CustomColor.primaryColor,
                    bottom:
                        //TabBar Implement
                        TabBar(
                      indicatorColor: CustomColor.secondaryColor,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.laptop),
                        ),
                        Tab(icon: Icon(Icons.mobile_off)),
                        Tab(icon: Icon(Icons.desktop_mac)),
                        Tab(
                          icon: Icon(Icons.chat_bubble_outline_outlined),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Details(), //Details Widget present /widget/submit_details
                      Details(),
                      Details(),
                      Details(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
