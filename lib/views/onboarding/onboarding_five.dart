import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/views/home/home.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/enter_code_dialog.dart';
import '../../main.dart';
import 'dart:math' as math;

class OnboardingFiveScreen extends StatefulWidget {
  const OnboardingFiveScreen({super.key});
  @override
  State<OnboardingFiveScreen> createState() => _OnboardingFiveScreenState();
}

class _OnboardingFiveScreenState extends State<OnboardingFiveScreen>
    with SingleTickerProviderStateMixin {
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
        });
  }

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isLoading = false;

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
                height: mq.height * 0.2,
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
                context: context,
                assetName: "assets/icons/arrow.svg",
                title: isLoading ? "Awaiting partner" : "INVITE MY PARTNER",
                height: mq.width * 0.05,
                width: mq.width * 0.05,
                widthbox: 12,
                widget: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: Container(
                      // margin: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/indicator.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.fitWidth,
                      )),
                ),
                isClick: isLoading,
                onPress: () {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(const Duration(seconds: 1), () {
                    Get.offAll(() => const Home(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 200));
                  });
                },
              ),
              8.heightBox,
              customOutlineButton(
                context: context,
                assetName: "assets/icons/arrow.svg",
                title: "ENTER INVITE CODE",
                height: mq.width * 0.05,
                width: mq.width * 0.05,
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
