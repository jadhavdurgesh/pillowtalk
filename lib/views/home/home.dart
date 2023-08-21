// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:pillowtalk/components/drawer_widget.dart';
// import 'package:pillowtalk/controllers/homecontroller.dart';
// import 'package:pillowtalk/views/home/discover_screen.dart';
// import 'package:pillowtalk/views/home/home_screen.dart';
// import 'package:pillowtalk/views/home/message_screen.dart';
// import '../../constants/colors.dart';
// import 'profile_screen.dart';

// class Home extends StatefulWidget {
//   final int currentNavIndex;
//   const Home({super.key, this.currentNavIndex = 0});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int currentNavIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     currentNavIndex = widget.currentNavIndex;
//   }

//   void onTap(int index) {
//     setState(() {
//       currentNavIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var navBarItems = [
//       BottomNavigationBarItem(
//           icon: SvgPicture.asset("assets/icons/home.svg"),
//           label: "Home",
//           backgroundColor: whiteColor),
//       BottomNavigationBarItem(
//           icon: SvgPicture.asset("assets/icons/discover.svg"),
//           label: "Discover"),
//       BottomNavigationBarItem(
//           icon: GestureDetector(
//             onTap: () {
//               Get.to(()=> const MessageScreen());
//             },
//             child: Container(
//               // color: Colors.red,
//               // width: 70,
//               child: SvgPicture.asset("assets/icons/message.svg"))), label: "Message"),
        
//       BottomNavigationBarItem(
//           icon: SvgPicture.asset("assets/icons/profile.svg"), label: "Profile"),
//     ];

//     var navBody = [
//       const HomeScreen(),
//       const DiscoverScreen(),
//       const MessageScreen(),
//       const ProfileScreen(),
//     ];

//     return Scaffold(
//       appBar: currentNavIndex == 2
//           ? AppBar(
//               leading: IconButton(
//                   onPressed: () {
//                     // controller.currentNavIndex.value = 0;
//                     Get.back(result: () => const Home());
//                     Get.offAll(() => const Home(),
//                         transition: Transition.rightToLeftWithFade,
//                         duration: const Duration(milliseconds: 200));
//                   },
//                   icon: SvgPicture.asset(
//                     "assets/icons/cross.svg",
//                   )),
//               backgroundColor: backgroundColor,
//               elevation: 0,
//             )
//           : AppBar(
//               backgroundColor: backgroundColor,
//               elevation: 0,
//               iconTheme: const IconThemeData(color: darkColor),
//               leading: Builder(
//                 builder: (context) {
//                   return IconButton(
//                       onPressed: () => Scaffold.of(context).openDrawer(),
//                       tooltip: MaterialLocalizations.of(context)
//                           .openAppDrawerTooltip,
//                       icon: SvgPicture.asset("assets/icons/drawer/drawer.svg"));
//                 },
//               ),
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: SvgPicture.asset(
//                     "assets/icons/notification.svg",
//                     width: 24,
//                   ),
//                 )
//               ],
//             ),
//       drawer: currentNavIndex == 2 ? null : customDrawer(),
//       body: Column(
//         children: [
//           Expanded(child: navBody[currentNavIndex]),
//         ],
//       ),
//       bottomNavigationBar: currentNavIndex == 2
//           ? null
//           : BottomNavigationBar(
//               backgroundColor: secondaryColor,
//               items: navBarItems,
//               currentIndex: currentNavIndex,
//               fixedColor: whiteColor,
//               unselectedItemColor: whiteColor,
//               type: BottomNavigationBarType.fixed,
//               onTap: onTap,
//             ),
//     );
//   }
// }
