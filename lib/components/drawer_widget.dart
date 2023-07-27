import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';
import '../constants/fonts/fontstyle.dart';

Widget customDrawer(){
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
                    Text(
                      "Follow us on socials",
                      style: kMontserratMedium.copyWith(
                          color: secondaryColor, fontSize: 18),
                    )
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
                  SvgPicture.asset(
                      "assets/icons/drawer/manage_subscription.svg"),
                  12.widthBox,
                  Text(
                    "Manage Subscription",
                    style: kMontserratMedium.copyWith(
                        color: secondaryColor, fontSize: 16),
                  ),
                ]),
                20.heightBox,
                Row(children: [
                  SvgPicture.asset("assets/icons/drawer/fingerprint.svg"),
                  12.widthBox,
                  Text(
                    "Privacy Policy",
                    style: kMontserratMedium.copyWith(
                        color: secondaryColor, fontSize: 16),
                  ),
                ]),
                20.heightBox,
                Row(children: [
                  SvgPicture.asset("assets/icons/drawer/termofuse.svg"),
                  12.widthBox,
                  Text(
                    "Term of use",
                    style: kMontserratMedium.copyWith(
                        color: secondaryColor, fontSize: 16),
                  ),
                ]),
              ],
            ),
          ),
        ],
      )
      );
}