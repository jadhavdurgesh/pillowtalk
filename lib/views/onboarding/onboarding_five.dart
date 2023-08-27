import 'package:flutter/material.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/enter_code_dialog.dart';

class OnboardingFiveScreen extends StatefulWidget {
  const OnboardingFiveScreen({super.key});
  @override
  State<OnboardingFiveScreen> createState() => _OnboardingFiveScreenState();
}

class _OnboardingFiveScreenState extends State<OnboardingFiveScreen> {

  Future<dynamic> showEnterCodeDialog() {
    return showGeneralDialog(
       barrierLabel: "Label",
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
        barrierDismissible: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const EnterCodeDialog();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
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
            const Text(
              "It takes two to tango",
              style: TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500
            ),
            ),
            14.heightBox,
            const Text(
              "Invite your partner to enjoy the full experience, or join using invite code.",
              style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500
            ),
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
