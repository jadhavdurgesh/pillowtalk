import 'package:flutter/material.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/enter_code_dialog.dart';
import '../../main.dart';

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
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(opacity: a1.value, child: const EnterCodeDialog()),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container();
        }
        // transitionBuilder: (context, anim1, anim2, child) {
        //   return SlideTransition(
        //     position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
        //         .animate(anim1),
        //     child: child,
        //   );
        // },
        );
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Expanded(child: Container()),
              SizedBox(
                height: mq.height*0.2,
              ),
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
                    fontWeight: FontWeight.w500),
              ),
              14.heightBox,
              const Text(
                "Invite your partner to enjoy the full experience, or join using invite code.",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
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
              // Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
