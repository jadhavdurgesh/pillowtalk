import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
        width: MediaQuery.of(context).size.width * 0.7,
        height: 300,
        isClip: false,
        // padding: EdgeInsets.only(right: 20),
        // currentIndex: currentIndex,
        onItemChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemConfig: GalleryItemConfig(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                    : Container(
                      color: whiteColor,
                      child: Opacity(
                          opacity: 0.55,
                          child: Image.asset(cardImagesList[index])),
                    )),
            Positioned(
              right: mq.width * 0.1,
              bottom: 50,
              child: currentIndex == index
                  ? Container(
                      // color: Colors.black,
                      child: SvgPicture.asset(
                        'assets/icons/cardbutton.svg',
                      ),
                    )
                  : Container(),
            ),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: backgroundColor,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: darkColor),
      //   leading: Builder(
      //     builder: (context) {
      //       return IconButton(
      //           onPressed: () => Scaffold.of(context).openDrawer(),
      //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //           icon: SvgPicture.asset("assets/icons/drawer/drawer.svg"));
      //     },
      //   ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         Get.to(()=> const NotificationScreen(), transition: Transition.noTransition );
      //       },
      //       child: Container(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 12),
      //           child: SvgPicture.asset(
      //             "assets/icons/notification.svg",
      //             width: 26,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      // drawer: customDrawer(),
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
              style: kMontserratMedium.copyWith(color: greyColor, fontSize: 18),
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
                // reverse: false,
                // allowImplicitScrolling: true,
                itemCount: 1,
                itemBuilder: ((context, index) {
                  return Container(
                      // color: primaryColor,
                      width: mq.width,
                      padding: EdgeInsets.only(
                          left: mq.width * 0.32, right: mq.width * 0.02),
                      child: buildGallery3D());
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
              12.heightBox,
              Column(
                children: [
                  Container(
                    height: mq.height * 0.1,
                    // color: primaryColor,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text('Intimacy Level')),
                        20.widthBox,
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomIndicator(
                              context: context,
                              progressIndex: currentIndex,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(),
                                ),
                                const Text(
                                  '😉',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(),
                                ),
                                const Text(
                                  '👄',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(),
                                ),
                                const Text(
                                  '👀',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(),
                                ),
                                const Text(
                                  '😈',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(height: mq.height*0.01,),
            ]),
          ),
        ],
      ),
    );
  }
}
