import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/fonts/fontstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              width: 24,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(decoration: BoxDecoration(color: secondaryColor),child: Row(
              children: [
                SvgPicture.asset("assets/icons/drawer/follow.svg"),
                Text(
                  "Follow us on socials",
                  style: kMontserratMedium,
                )
              ],
            ),
            )
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, John & Jane",
              style: kMontserratMedium.copyWith(fontSize: 20),
            ),
            8.heightBox,
            Text(
              "Pick a card",
              style: kMontserratMedium.copyWith(color: greyColor, fontSize: 18),
            ),
            20.heightBox,
            VxSwiper.builder(
              aspectRatio: 3 / 4,
              // viewportFraction: 0.6,
              // height: 500,
              // autoPlayCurve: Curves.bounceIn,
              enlargeCenterPage: true,
              itemCount: cardImagesList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset(
                          cardImagesList[index],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    20.heightBox,
                    Text(cardStringsList[index]),
                    20.heightBox,
                    Expanded(child: Text(descCardLlist[index]))
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
