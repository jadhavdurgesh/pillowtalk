import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';

import 'discover_screen.dart';
import 'home_screen.dart';
import 'message_screen.dart';
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
      body: PageStorage(bucket: _pageStorageBucket, child: currentScreen),
      bottomNavigationBar: Container(
        height: 90,
        color: secondaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SvgPicture.asset('assets/icons/home.svg',width: 26,),
                const Text(
                  'Home',
                  style: TextStyle(color: whiteColor),
                )
              ],
            ),
            Column(
              children: [
                SvgPicture.asset('assets/icons/discover.svg',width: 26),
                const Text(
                  'Discover',
                  style: TextStyle(color: whiteColor),
                )
              ],
            ),
            Column(
              children: [
                SvgPicture.asset('assets/icons/message.svg',width: 26),
                const Text(
                  'Message',
                  style: TextStyle(color: whiteColor),
                )
              ],
            ),
            Column(
              children: [
                SvgPicture.asset('assets/icons/profile.svg',width: 26),
                const Text(
                  'Profile',
                  style: TextStyle(color: whiteColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
