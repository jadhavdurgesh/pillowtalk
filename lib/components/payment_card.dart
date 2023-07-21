import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/fonts/fontstyle.dart';

Widget paymentCard(){
  return Container(
    // padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: lightColor),
      boxShadow: const [
        BoxShadow(
          color: lightColor,
          blurRadius: 10.0
        )
      ]
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Text(
            "POPULAR",
            style: kMontserratMedium.copyWith(
              color: secondaryColor
            ),
          ),
          16.heightBox,
          Text(
            "5 Packs",
            style: kMontserratMedium
          ),
          16.heightBox,
          Text(
            "\$1e/a",
            style: kMontserratMedium
          ),
          16.heightBox,
          Image.asset(
            "assets/payment.png"
          ),
          16.heightBox,
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            borderRadius: BorderRadius.circular(2)
            ),
            child: Text(
              "Saved 30%",
              style: kRobotoMedium,
            ),
          ),
          16.heightBox,
          customOutlineButton(
            title: "GET 5 FOR \$5",
            assetName: "assets/icons/arrow.svg",
            widthbox: 8,
            onPress: (){},
          )
        ],
      ),
    ),
  );
}