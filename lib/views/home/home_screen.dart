import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/components/custom_indicator.dart';
import 'package:pillowtalk/components/drawer_widget.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:pillowtalk/main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/fonts/fontstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var isExpanded = false;
  int currentIndex = 0;
  final Random random = Random();

  Widget buildGallery3D() {
    return Gallery3D(
        controller: Gallery3DController(
          itemCount: cardImagesList.length,
          autoLoop: false,
          minScale: 0.8,
        ),
        width: MediaQuery.of(context).size.width*0.5,
        height: 300,
        isClip: false,
        // currentIndex: currentIndex,
        onItemChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemConfig: GalleryItemConfig(
          width: MediaQuery.of(context).size.width,
          height: 450,
          radius: 12,
          isShowTransformMask: false,
          // shadows: [
          //   BoxShadow(
          //       color: Color(0x90000000), offset: Offset(2, 0), blurRadius: 1)
          // ]
        ),
        // onClickItem: (index) => print("currentIndex:$index"),
        itemBuilder: (context, index) {
          return Stack(children: [
            Container(
                // color: secondaryColor,
                child: currentIndex == index
                    ? Image.asset(cardImagesList[index])
                    : Opacity(
                        opacity: 0.55,
                        child: Image.asset(cardImagesList[index]))),
            Positioned(
              right: mq.width * 0.4,
              bottom: 70,
              child: Container(
                // color: Colors.black,
                child: SvgPicture.asset(
                  'assets/icons/cardbutton.svg',
                ),
              ),
            ),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
      drawer: customDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Welcome, John & Jane",
              style: kMontserratMedium.copyWith(fontSize: 20),
            ),
          ),
          8.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Pick a card",
              style:
                  kMontserratMedium.copyWith(color: greyColor, fontSize: 18),
            ),
          ),
          28.heightBox,
          Container(
            height: mq.height * 0.45,
            // color: primaryColor,
            // padding: const EdgeInsets.symmetric(horizontal: ),
            alignment: Alignment.center,
            child: PageView.builder(
                controller: PageController(),
                clipBehavior: Clip.hardEdge,
                // padEnds: false,
                itemCount: cardImagesList.length,
                itemBuilder: ((context, index) {
                  return buildGallery3D();
                })),
          ),
          16.heightBox,
          // AnimatedOpacity(
          //   opacity: 1,
          //   duration: const Duration(milliseconds: 400),
          //   child: Text(cardStringsList[currentIndex]),
          // )
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              Text(
                cardStringsList[currentIndex],
                style: kMontserratMedium.copyWith(fontSize: 22),
              ),
              20.heightBox,
              Text(descCardLlist[currentIndex],
                  style: const TextStyle(fontSize: 16)),
              8.heightBox,
              Stack(
                children: [
                  Container(
                    height: 85,
                    // color: primaryColor,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Intimacy Level'
                        ),
                        20.widthBox,
                        CustomIndicator(context: context, progressIndex: currentIndex,),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -4,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            '😉',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          48.widthBox,
                          const Text(
                            '👄',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                           48.widthBox,
                          const Text(
                            '👀',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                           48.widthBox,
                          const Text(
                            '😈',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
