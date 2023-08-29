import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/drawer_widget.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/main.dart';
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
    mq = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
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
            InkWell(
              onTap: () {
                Get.to(() => const NotificationScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200));
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
          height: 56,
          color: secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: mq.width*0.239,
                padding: const EdgeInsets.only(top: 8),
                height: 60,
                // color: primaryColor,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/home.svg',
                    ),
                    4.heightBox,
                    const Text(
                      'Home',
                      style: TextStyle(color: whiteColor, fontSize: 12),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => const DiscoverScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                  );
                },
                child: Container(
                  width: mq.width*0.239,
                  padding: const EdgeInsets.only(top: 8),
                  height: 60,
                  // color: primaryColor,
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/discover.svg'),
                      4.heightBox,
                      const Text(
                        'Discover',
                        style: TextStyle(color: whiteColor, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.to(
                    () => const MessageScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                  );
                },
                child: Container(
                  // color: primaryColor,
                  width: mq.width*0.239,
                  padding: const EdgeInsets.only(top: 8),
                  height: 60,
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/message.svg',
                      width: 22,
                      ),
                      4.heightBox,
                      const Text(
                        'Message',
                        style: TextStyle(color: whiteColor,fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => const ProfileScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                  );
                },
                child: Container(
                  width: mq.width*0.239,
                  padding: const EdgeInsets.only(top: 8),
                  height: 60,
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/profile.svg'),
                      4.heightBox,
                      const Text(
                        'Profile',
                        style: TextStyle(color: whiteColor, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
