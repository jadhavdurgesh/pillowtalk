import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/lists.dart';

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInsets = 20.0;
  CardScrollWidget({super.key, this.currentPage});

  @override
  Widget build(BuildContext context) {
    var cardAspectRatio = 12.0 / 16.0;
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
            var delta = i - currentPage;
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
                      Image.asset(cardImagesList[i], fit: BoxFit.fill,)
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
