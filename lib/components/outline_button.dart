import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../constants/fonts/fontstyle.dart';

Widget customOutlineButton(
    {String? title,
    String? assetName,
    double? height,
    double? width,
    double? widthbox,
    bool isWidget = false,
    Widget? customWidget,
    void Function()? onPress}) {
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(width: 1.0, color: secondaryColor.withOpacity(0.5)),
      ),
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isWidget ? customWidget! : SvgPicture.asset(
              assetName!,
              width: width,
              height: height,
            ),
            SizedBox(
              width: widthbox,
            ),
            Text(
              title!,
              style: kRobotoMedium.copyWith(color: secondaryColor),
            ),
          ],
        ),
      ));
}
