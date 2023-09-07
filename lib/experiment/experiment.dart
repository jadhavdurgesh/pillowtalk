import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

class Experiment extends StatefulWidget {
  const Experiment({super.key});

  @override
  State<Experiment> createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  var currentPage = cardImagesList.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: cardImagesList.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            100.heightBox,
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
    var cardAspectRatio = 12/17;
    var widgetAspectRatio = cardAspectRatio * 1.2;
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
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(cardImagesList[i], fit: BoxFit.fill),
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
