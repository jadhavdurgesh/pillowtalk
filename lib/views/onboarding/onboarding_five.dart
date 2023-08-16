import 'package:flutter/material.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/enter_code_dialog.dart';

class OnboardingFiveScreen extends StatefulWidget {
  const OnboardingFiveScreen({super.key});
  @override
  State<OnboardingFiveScreen> createState() => _OnboardingFiveScreenState();
}

class _OnboardingFiveScreenState extends State<OnboardingFiveScreen> {

  Future<dynamic> showEnterCodeDialog() {
    return showDialog(
      context: context,
      builder: (ctx) => const EnterCodeDialog()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Container()),
            Center(
                child: Image.asset(
              "assets/illustration2.png",
              width: 220,
            )),
            24.heightBox,
            Text(
              "It takes two to tango",
              style: kMontserratMedium.copyWith(fontSize: 20),
            ),
            14.heightBox,
            Text(
              "Invite your partner to enjoy the full experience, or\njoin using invite code.",
              style: kMontserratMedium,
            ),
            20.heightBox,
            customOutlineButton(
              assetName: "assets/icons/arrow.svg",
              title: "INVITE MY PARTNER",
              height: 22,
              width: 22,
              widthbox: 12,
            ),
            8.heightBox,
            customOutlineButton(
              assetName: "assets/icons/arrow.svg",
              title: "ENTER INVITE CODE",
              height: 22,
              width: 22,
              widthbox: 12,
              onPress: () {
                showEnterCodeDialog();
              },
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
