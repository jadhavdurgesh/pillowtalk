import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../constants/colors.dart';
import '../constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'onboarding/onboarding_one.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

  late Image image1;
  late Image image2;
  late Image image3;


  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      (){
        image1 = Image.asset("assets/banner1.png");
        image2 = Image.asset("assets/banner2.png");
        image3 = Image.asset("assets/banner3.png");
        Get.off(()=> OnboardingOneScreen(image1: image1,image2: image2,image3: image3,), transition: Transition.noTransition);
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          // Logo file
          Center(
              child: Image.asset(
            "assets/logo.png",
            width: 130,
            height: 130,
          )),
          
          28.heightBox,

          Text(
            "Playdate",
            style: kMontserratMedium.copyWith(fontSize: 22),
          ),

          16.heightBox,

          Text(
            'Discovering the spark',
            style: kMontserratMedium,
          ),

          32.heightBox,
          AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Image.asset("assets/indicator.png", width: 40, height: 40, fit: BoxFit.fitWidth,)
                ),
              ),
          Expanded(child: Container()),
          Text("V1.2.1", style: kMontserratMedium.copyWith(
            color: lightColor
          ),),

          48.heightBox
        ],
      ),
    );
  }
}
