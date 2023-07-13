import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/colors.dart';
import '../components/progress_indicator.dart';
import '../constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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

          customCircularProgressIndicator(),

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
