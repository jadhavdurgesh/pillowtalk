import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'onbaording_four.dart';
import 'onboarding_two.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/banner3.png"),
          Expanded(flex: 1, child: Container()),
          Text(
            "Strengthening\ninitimacy",
            textAlign: TextAlign.center,
            style: kMontserratMedium.copyWith(fontSize: 20),
          ),
          16.heightBox,
          customOutlineButton(
            assetName:  "assets/icons/arrow.svg",
            title: "LET'S BEGIN",
            height: 22,
            width: 22,
            widthbox: 4.0,
            onPress: () {Get.to(() => OnboardingFourScreen(), transition: Transition.rightToLeftWithFade);},
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
