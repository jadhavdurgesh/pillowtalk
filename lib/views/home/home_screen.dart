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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var isExpanded = false;
  int currentIndex = 0;

  Widget buildGallery3D() {
    return Gallery3D(
        controller: Gallery3DController(
          itemCount: cardImagesList.length,
          autoLoop: false,
          minScale: 0.3,
          // ellipseHeight: 50
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        isClip: false,
        // padding: EdgeInsets.only(right: 20, left: 50),
        // currentIndex: currentIndex,
        onItemChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        onClickItem: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemConfig: GalleryItemConfig(
          width: MediaQuery.of(context).size.width*0.66,
          height: MediaQuery.of(context).size.height,
          radius: 20,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Welcome, John & Jane",
              style: TextStyle(
                  fontSize: mq.width * 0.048,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: mq.width * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Pick a card",
              style: TextStyle(
                  fontSize: mq.width * 0.044,
                  color: greyColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: mq.height * 0.02,
          ),
          Container(
            height: mq.height * 0.52,
            // color: primaryColor,
            // padding: const EdgeInsets.symmetric(horizontal: ),
            // alignment: Alignment.center,
            child: PageView.builder(
                controller: PageController(),
                clipBehavior: Clip.hardEdge,
                // padEnds: false,
                // reverse: false,
                // allowImplicitScrolling: true,
                itemCount: 1,
                itemBuilder: ((context, index) {
                  return Center(
                    child: Container(
                        // color: primaryColor,
                        width: mq.width,
                        padding: EdgeInsets.only(
                            left: mq.width*0.001, right: mq.width * 0.2),
                        child: buildGallery3D()),
                  );
                })),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              Text(
                cardStringsList[currentIndex],
                style: TextStyle(
                    fontSize: mq.width * 0.054,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                height: mq.height * 0.08,
                // color: secondaryColor,
                child: Text(descCardLlist[currentIndex],
                    style: TextStyle(
                        fontSize: mq.width * 0.038,
                        fontFamily: 'Univers',
                        fontWeight: FontWeight.w300)),
              ),
              Column(
                children: [
                  Container(
                    height: mq.height * 0.11,
                    // color: primaryColor,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              'Intimacy level',
                              style: TextStyle(
                                  color: greyColor, fontFamily: 'Montserrat'),
                            )),
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
              // Container(
              //   color: primaryColor,
              //   height: mq.height * 0.03,
              // ),
            ]),
          ),
        ],
      ),
    );
  }
}
