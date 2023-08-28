import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

Widget customDrawer() {
  return Drawer(
      child: ListView(
    children: [
      DrawerHeader(
        child: Column(
          children: [
            20.heightBox,
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/drawer/follow.svg",
                  width: 24,
                  height: 24,
                ),
                8.widthBox,
                const Text("Follow us on socials",
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500)),
              ],
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/drawer/Facebook.svg",
                  width: 36,
                ),
                20.widthBox,
                Image.asset(
                  "assets/Instagram.png",
                  width: 36,
                ),
                20.widthBox,
                SvgPicture.asset(
                  "assets/icons/drawer/Twitter.svg",
                  width: 36,
                ),
                20.widthBox,
                SvgPicture.asset(
                  "assets/icons/drawer/Snapchat.svg",
                  width: 36,
                ),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(children: [
              SvgPicture.asset("assets/icons/drawer/manage_subscription.svg"),
              12.widthBox,
              const Text(
                "Manage Subscription",
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
            ]),
            20.heightBox,
            Row(children: [
              SvgPicture.asset("assets/icons/drawer/fingerprint.svg"),
              12.widthBox,
              const Text(
                "Privacy Policy",
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
            ]),
            20.heightBox,
            Row(children: [
              SvgPicture.asset("assets/icons/drawer/termofuse.svg"),
              12.widthBox,
              const Text(
                "Term of use",
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
            ]),
          ],
        ),
      ),
    ],
  ));
}
