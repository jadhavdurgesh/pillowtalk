import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:pillowtalk/views/onboarding/onboarding_two.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/banner1.png"),
          Expanded(flex: 1, child: Container()),
          Text(
            "Conneting with\nyour partner",
            textAlign: TextAlign.center,
            style: kMontserratMedium.copyWith(fontSize: 20),
          ),
          16.heightBox,
          customOutlineButton(
            title: "CONTINUE",
            assetName: "assets/icons/arrow.svg",
            height: 22,
            width: 22,
            widthbox: 4.0,
            onPress: () {
              Get.to(() => OnboardingTwoScreen(), transition: Transition.rightToLeftWithFade);
              },
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
