// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/main.dart';

import 'indicator.dart';

class CustomIndicator extends StatefulWidget {
  final BuildContext context;
  final int progressIndex;
  const CustomIndicator({
    Key? key,
    required this.context,
    required this.progressIndex,
  }) : super(key: key);

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: 280,
      // color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.progressIndex >= 1
              ? indicatorContainer(21, 21, primaryColor)
              : indicatorContainer(21, 21, lightColor),
          widget.progressIndex >= 1
              ? indicatorContainer(14, 14, primaryColor)
              : indicatorContainer(14, 14, lightColor),
          widget.progressIndex >= 1
              ? indicatorContainer(14, 20, primaryColor)
              : indicatorContainer(14, 20, lightColor),
          widget.progressIndex >= 1
              ? indicatorContainer(20, 14, primaryColor)
              : indicatorContainer(20, 14, lightColor),
          widget.progressIndex >= 2
              ? indicatorContainer(14, 20, primaryColor)
              : indicatorContainer(14, 20, lightColor),
          widget.progressIndex >= 2
              ? indicatorContainer(20, 14, primaryColor)
              : indicatorContainer(20, 14, lightColor),
          widget.progressIndex >= 2
              ? indicatorContainer(14, 14, primaryColor)
              : indicatorContainer(14, 14, lightColor),
          widget.progressIndex >= 2
              ? indicatorContainer(14, 20, primaryColor)
              : indicatorContainer(14, 20, lightColor),
          widget.progressIndex >= 3
              ? indicatorContainer(20, 14, primaryColor)
              : indicatorContainer(20, 14, lightColor),
          widget.progressIndex >= 3
              ? indicatorContainer(14, 20, primaryColor)
              : indicatorContainer(14, 20, lightColor),
          widget.progressIndex >= 3
              ? indicatorContainer(14, 14, primaryColor)
              : indicatorContainer(14, 14, lightColor),
          widget.progressIndex >= 3
              ? indicatorContainer(20, 14, primaryColor)
              : indicatorContainer(20, 14, lightColor),
          widget.progressIndex >= 3
              ? indicatorContainer(14, 20, primaryColor)
              : indicatorContainer(14, 20, lightColor),
          indicatorContainer(20, 14, lightColor),
          indicatorContainer(14, 20, lightColor),
          indicatorContainer(20, 14, lightColor),
          indicatorContainer(21, 21, lightColor),
        ],
      ),
    );
  }
}
