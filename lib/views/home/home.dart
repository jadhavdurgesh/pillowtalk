import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/controllers/homecontroller.dart';
import 'package:pillowtalk/views/home/discover_screen.dart';
import 'package:pillowtalk/views/home/home_screen.dart';
import 'package:pillowtalk/views/home/message_screen.dart';
import '../../constants/colors.dart';
import 'profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var navBarItems = [
      BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/home.svg"),
          label: "Home",
          backgroundColor: whiteColor),
      BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/discover.svg"),
          label: "Discover"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/message.svg"), label: "Message"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/profile.svg"), label: "Profile"),
    ];

    var navBody = [
      const HomeScreen(),
      const DiscoverScreen(),
      const MessageScreen(),
      const ProfileScreen(),
    ];

    var controller = Get.put(Homecontroller());

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value)))
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: secondaryColor,
          currentIndex: controller.currentNavIndex.value,
          items: navBarItems,
          fixedColor: whiteColor,
          unselectedItemColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
