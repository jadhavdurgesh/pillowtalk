import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/drawer_widget.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'discover_screen.dart';
import 'home_screen.dart';
import 'message_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentNavIndex = 0;
  final List<Widget> navBody = [
    const HomeScreen(),
    const DiscoverScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  final PageStorageBucket _pageStorageBucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: darkColor),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: SvgPicture.asset("assets/icons/drawer/drawer.svg"));
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(()=> const NotificationScreen(), transition: Transition.noTransition );
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  "assets/icons/notification.svg",
                  width: 26,
                ),
              ),
            ),
          )
        ],
      ),
      drawer: customDrawer(),
      body: PageStorage(bucket: _pageStorageBucket, child: currentScreen),
      bottomNavigationBar: Container(
        height: 70,
        color: secondaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70,
              // color: primaryColor,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/home.svg',
                  ),
                  4.heightBox,
                  const Text(
                    'Home',
                    style: TextStyle(color: whiteColor),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(()=> const DiscoverScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 200),);
              },
              child: Container(
                width: 70,
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/discover.svg'),
                    4.heightBox,
                    const Text(
                      'Discover',
                      style: TextStyle(color: whiteColor),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.to(()=> const MessageScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 200),);
              },
              child: Container(
                // color: primaryColor,
                width: 70,
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/message.svg'),
                    4.heightBox,
                    const Text(
                      'Message',
                      style: TextStyle(color: whiteColor),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(()=> const ProfileScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 200),);
              },
              child: Container(
                 width: 70,
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/profile.svg'),
                    4.heightBox,
                    const Text(
                      'Profile',
                      style: TextStyle(color: whiteColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
