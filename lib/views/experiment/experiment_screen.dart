import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

class ExperimentScreen extends StatefulWidget {
  const ExperimentScreen({super.key});

  @override
  State<ExperimentScreen> createState() => _ExperimentScreenState();
}

class _ExperimentScreenState extends State<ExperimentScreen> {
  var currentPage = cardImagesList.length - 1.0;

    PageController controller = PageController(initialPage: cardImagesList.length - 1);
  get child => null;
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      print("trigger");
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          50.heightBox,
          Stack(
            children: [
              CardScrollWidget(currentPage: currentPage, controller: controller,),
              Positioned.fill(
                  child: PageView.builder(
                itemCount: cardImagesList.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container(
                      );
                },
              ))
            ],
          )
        ],
      )),
    );
  }
}

class CardScrollWidget extends StatefulWidget {
  var currentPage;
  PageController controller;
  CardScrollWidget({
    Key? key,
    required this.currentPage,
    required this.controller,
  }) : super(key: key);

  @override
  State<CardScrollWidget> createState() => _CardScrollWidgetState();
}

class _CardScrollWidgetState extends State<CardScrollWidget> {
  var padding = 20.0;

  var verticalInsets = 20.0;

  @override
  Widget build(BuildContext context) {
    var cardAspectRatio = 12.0 / 17.0;
    var widgetAspectRatio = cardAspectRatio * 1.2;
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var height = constraints.maxHeight;
          var width = constraints.maxWidth;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (var i = 0; i < cardImagesList.length; i++) {
            var delta = i - widget.currentPage;
            bool isOnRight = delta > 0;
            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);
            var cardItem = Positioned.directional(
              top: padding + verticalInsets * max(-delta, 0.0),
              bottom: padding + verticalInsets * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: Container(
                // color: secondaryColor,
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        cardImagesList[i],
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            print("YOOOOOOO");
                            widget.controller.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.only(right: 50, bottom: 50),
                            // color: secondaryColor,
                            child: SvgPicture.asset(
                              'assets/icons/cardbutton.svg',
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ),
                        ),
                        // child: FloatingActionButton(onPressed: () {
                        //   controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                          
                        // },),
                      )
                      // Positioned(child: Container(height: 10,width: 10, color: Colors.,))
                    ],
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
