import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mobile_service/widget/colors.dart';
import 'package:mobile_service/widget/custom_drawer.dart';
import 'package:mobile_service/widget/laptopdetails.dart';
import 'package:mobile_service/widget/mobiledetails.dart';
import 'package:mobile_service/widget/image_slider.dart';
import 'package:mobile_service/widget/tabletdetails.dart';

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
                initialIndex: 0,
                length: 4,
                child: Scaffold(
                  backgroundColor: CustomColor.primaryColor,
                  appBar:
                      //TabBar Implement
                      TabBar(
                    indicatorColor: CustomColor.secondaryColor,
                    tabs: [
                      Tab(
                        text: 'Laptops',
                        icon: Icon(Ionicons.laptop_outline),
                      ),
                      Tab(
                        text: 'Mobiles',
                        icon: Icon(Ionicons.phone_portrait_outline),
                      ),
                      Tab(
                        text: "Tablets",
                        icon: Icon(Ionicons.tablet_landscape_outline),
                      ),
                      Tab(
                        text: "Desktops",
                        icon: Icon(MaterialCommunityIcons.desktop_tower),
                      ),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      LaptopDetails(),
                      MobileDetails(),
                      TabletDetails(),
                      MobileDetails(),
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
