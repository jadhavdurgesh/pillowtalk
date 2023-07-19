import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:pillowtalk/views/onboarding/onboarding_two.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingOneScreen extends StatefulWidget {
  final Image image1;
  final Image image2;
  final Image image3;
  const OnboardingOneScreen({super.key, required this.image1, required this.image2, required this.image3});

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {

  // @override
  // void didChangeDependencies() {
  //   precacheImage(widget.image1.image, context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          // SvgPicture.asset("assets/banner1.svg"),
          widget.image1,
          // Image.asset("assets/banner1.png"),
          // CachedNetworkImage(imageUrl: 'https://couplegames.s3.amazonaws.com/Onboarding+Screens/Screen1.png'),
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
              Get.to(()=> OnboardingTwoScreen(image2: widget.image2, image3: widget.image3,), transition: Transition.noTransition);
              },
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
