import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';
import 'onbaording_four.dart';

class OnboardingThreeScreen extends StatefulWidget {
  final Image image3;
  const OnboardingThreeScreen({super.key, required this.image3});

  @override
  State<OnboardingThreeScreen> createState() => _OnboardingThreeScreenState();
}

class _OnboardingThreeScreenState extends State<OnboardingThreeScreen> {

  // late Image image3;

  // @override
  // void initState() {
  //   super.initState();
  //   image3 = Image.asset("assets/banner3.png");
  // }

  // @override
  // void didChangeDependencies() {
  //   precacheImage(widget.image3.image, context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          widget.image3,
          // SvgPicture.asset("assets/banner3.svg", fit: BoxFit.cover, color: Colors.black,),
          // Image.asset("assets/banner3.png"),
          // CachedNetworkImage(imageUrl: 'https://couplegames.s3.amazonaws.com/Onboarding+Screens/Screen3.png'),
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
            onPress: () {
              Get.to(()=> const OnboardingFourScreen(), transition: Transition.noTransition);
              },
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
