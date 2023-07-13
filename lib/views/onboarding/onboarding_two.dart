import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import 'onboarding_three.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/banner2.png"),
          Expanded(flex: 1, child: Container()),
          Text(
            "Deepen\ncommunication",
            textAlign: TextAlign.center,
            style: kMontserratMedium.copyWith(fontSize: 20),
          ),
          16.heightBox,
          customOutlineButton(
            assetName: "assets/icons/arrow.svg",
            title: "CONTINUE",
            height: 22,
            width: 22,
            widthbox: 4.0,
            onPress: () {Get.to(() => OnboardingThreeScreen(), transition: Transition.rightToLeftWithFade);},
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
