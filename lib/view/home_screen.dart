import 'package:flutter/material.dart';
import 'package:mobile_service/widget/colors.dart';
import 'package:mobile_service/widget/custom_drawer.dart';
import 'package:mobile_service/widget/submit_details.dart';
import 'package:mobile_service/widget/image_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            ImageSlider(),
            Flexible(
              child: DefaultTabController(
                length: 4,
                child: Scaffold(
                  backgroundColor: CustomColor.primaryColor,
                  appBar:
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
                  body: TabBarView(
                    children: [
                      SubmitDetails(), //Details Widget present /widget/submit_details
                      SubmitDetails(),
                      SubmitDetails(),
                      SubmitDetails(),
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
