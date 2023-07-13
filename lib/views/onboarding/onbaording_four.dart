import 'package:flutter/material.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingFourScreen extends StatelessWidget {
  const OnboardingFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            100.heightBox,
            Center(
                child: Image.asset(
              "assets/illustration1.jpg",
              width: 220,
            )),
            24.heightBox,
            Text(
              "Love is in the air",
              style: kMontserratMedium.copyWith(fontSize: 20),
            ),
            14.heightBox,
            Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Create an account",
                      style: kMontserratMedium.copyWith(
                          fontSize: 14,
                          color: secondaryColor,
                          decoration: TextDecoration.underline),
                    )),
                Text(
                  " or ",
                  style: kMontserratMedium,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "log in",
                      style: kMontserratMedium.copyWith(
                          color: secondaryColor,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
            20.heightBox,
            customOutlineButton(
              assetName: "assets/icons/google.svg",
              title: "CONTINUE WITH GOOGLE",
              height: 18,
              width: 18,
              widthbox: 12,
            ),
            8.heightBox,
            customOutlineButton(
              assetName: "assets/icons/Facebook.svg",
              title: "CONTINUE WITH FACEBOOK",
              height: 20,
              width: 20,
              widthbox: 12,
            ),
            8.heightBox,
            customOutlineButton(
              assetName: "assets/icons/apple.svg",
              title: "CONTINUE WITH APPLE",
              height: 20,
              width: 20,
              widthbox: 12,
            ),
          ],
        ),
      ),
    );
  }
}
