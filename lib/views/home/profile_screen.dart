import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/drawer_widget.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/main.dart';
import 'package:velocity_x/velocity_x.dart';

import 'discover_screen.dart';
import 'home.dart';
import 'message_screen.dart';
import 'notification_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Setting',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: mq.width * 0.05),
              ),
            ),
            SizedBox(
              height: mq.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset('assets/premiumCard.png'),
            ),
            SizedBox(
              height: mq.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: lightColor),
                    boxShadow: const [
                      BoxShadow(color: lightColor, blurRadius: 10.0)
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: mq.width * 0.08, horizontal: mq.width * 0.12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/people.svg'),
                          16.widthBox,
                          Text(
                            "Profile setting",
                            style: TextStyle(
                                // color: secondaryColor,
                                fontFamily: 'Montserrat',
                                fontSize: mq.width * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mq.width * 0.04,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/feedback.svg'),
                          16.widthBox,
                          Text(
                            "Feedback",
                            style: TextStyle(
                                // color: secondaryColor,
                                fontFamily: 'Montserrat',
                                fontSize: mq.width * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mq.width * 0.04,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/account_box.svg'),
                          16.widthBox,
                          Text(
                            "Account setting",
                            style: TextStyle(
                                // color: secondaryColor,
                                fontFamily: 'Montserrat',
                                fontSize: mq.width * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mq.width * 0.04,
                      ),
                      Text(
                        'Privacy policy',
                        style: TextStyle(
                            fontSize: mq.width * 0.035,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        height: mq.width * 0.04,
                      ),
                      Text(
                        'Terms of use',
                        style: TextStyle(
                            fontSize: mq.width * 0.035,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        height: mq.width * 0.2,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/public.svg'),
                          16.widthBox,
                          Text(
                            "V.1.101",
                            style: TextStyle(
                                // color: secondaryColor,
                                fontFamily: 'Montserrat',
                                fontSize: mq.width * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 56,
          color: secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.to(
                    () => const Home(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                  );
                },
                child: Container(
                  width: mq.width * 0.239,
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
                  width: mq.width * 0.239,
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
                  width: mq.width * 0.239,
                  padding: const EdgeInsets.only(top: 8),
                  height: 60,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/message.svg',
                        width: 22,
                      ),
                      4.heightBox,
                      const Text(
                        'Message',
                        style: TextStyle(color: whiteColor, fontSize: 12),
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
                  width: mq.width * 0.239,
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
