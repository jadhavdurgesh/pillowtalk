import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';
import 'onboarding_three.dart';

class OnboardingTwoScreen extends StatefulWidget {
  final Image image2;
  final Image image3;

  const OnboardingTwoScreen({super.key, required this.image2, required this.image3});

  @override
  State<OnboardingTwoScreen> createState() => _OnboardingTwoScreenState();
}

class _OnboardingTwoScreenState extends State<OnboardingTwoScreen> {

  // @override
  // void didChangeDependencies() {
  //   precacheImage(widget.image2.image, context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // SvgPicture.asset("assets/banner2.svg"),
          widget.image2,
          // Image.asset("assets/banner2.png"),
          // CachedNetworkImage(imageUrl: 'https://couplegames.s3.amazonaws.com/Onboarding+Screens/Screen2.png'),
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
            onPress: () {
              Get.to(()=> OnboardingThreeScreen(image3: widget.image3), transition: Transition.noTransition );
              },
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
