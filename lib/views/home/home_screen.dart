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

import 'message_screen.dart';

int currentIndex = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var cardAspectRatio = 2 / 3;
var widgetAspectRatio = cardAspectRatio * 1.55;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var isExpanded = false;
  var currentPage = cardImagesList.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: cardImagesList.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
        currentIndex == currentPage;
      });
    });
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
          // SizedBox(
          //   height: mq.height * 0.02,
          // ),
          Container(
            // color: primaryColor,
            height: mq.height * 0.45,
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                        child: PageView.builder(
                          itemCount: cardImagesList.length,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container(
                                // color: primaryColor,
                                );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              Text(
                cardStringsList[currentPage.round().toInt()],
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
                child: Text(descCardLlist[currentPage.round().toInt()],
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
                              progressIndex: currentPage.round().toInt(),
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

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 0.0;
  var verticalInset = 30.0;
  CardScrollWidget(this.currentPage, {super.key});
  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget>? cardList = [];

        for (var i = 0; i < cardImagesList.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36.0),
              child: Container(
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    // fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(cardImagesList[i], fit: BoxFit.fill),
                      Positioned(
                          bottom: mq.width * 0.14,
                          right: mq.width * 0.08,
                          child: i == currentPage
                              ? SvgPicture.asset(
                                  'assets/icons/cardbutton.svg',
                                )
                              : Container()),
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
