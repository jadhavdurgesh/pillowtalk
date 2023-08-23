import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/code_textfield.dart';
import 'package:pillowtalk/views/home/home1.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' as math;
import '../constants/colors.dart';
import '../constants/fonts/fontstyle.dart';
import 'outline_button.dart';

class EnterCodeDialog extends StatefulWidget {
  const EnterCodeDialog({super.key});

  @override
  State<EnterCodeDialog> createState() => _EnterCodeDialogState();
}

class _EnterCodeDialogState extends State<EnterCodeDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StatefulBuilder(builder: (stfContext, stfSetState) {
        return Dialog(
          insetAnimationCurve: Curves.easeInOut,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: backgroundColor),
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enter invite code",
                    textAlign: TextAlign.center,
                    style: kMontserratMedium.copyWith(fontSize: 18),
                  ),
                  8.heightBox,
                  Text(
                    "When your partner invited you to Playdate, their message should included a 4 digit code.",
                    textAlign: TextAlign.center,
                    style: kMontserratMedium.copyWith(fontSize: 12),
                  ),
                  16.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      codeTextField(context: context),
                      codeTextField(context: context),
                      codeTextField(context: context),
                      codeTextField(context: context),
                    ],
                  ),
                  36.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLoading
                          ? Row(
                              children: [
                                const Text(
                                  'Entering',
                                  style: TextStyle(color: lightColor),
                                ),
                                AnimatedBuilder(
                                  animation: _controller,
                                  builder: (_, child) {
                                    return Transform.rotate(
                                      angle: _controller.value * 2 * math.pi,
                                      child: child,
                                    );
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        "assets/indicator.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                              ],
                            )
                          : customOutlineButton(
                              title: "ENTER",
                              assetName: "assets/icons/arrow.svg",
                              height: 22,
                              width: 22,
                              widthbox: 4.0,
                              onPress: () {
                                stfSetState(() {
                                  isLoading = true;
                                });
                                // Get.back();
                                Get.offAll(() => const Home(),
                                    transition: Transition.rightToLeftWithFade,
                                    duration:
                                        const Duration(milliseconds: 1000));
                              },
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
