import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/code_textfield.dart';
import 'package:pillowtalk/views/home/home1.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';
import '../constants/fonts/fontstyle.dart';
import '../views/home/home.dart';
import 'outline_button.dart';

class EnterCodeDialog extends StatefulWidget {
  const EnterCodeDialog({super.key});

  @override
  State<EnterCodeDialog> createState() => _EnterCodeDialogState();
}

class _EnterCodeDialogState extends State<EnterCodeDialog> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
                      customOutlineButton(
                        title: isLoading ? "ENTERING" : "ENTER",
                        assetName: "assets/icons/arrow.svg",
                        height: 22,
                        width: 22,
                        widthbox: 4.0,
                        onPress: () {
                          stfSetState(() {
                            isLoading = true;
                          });
                          // Get.back();
                          Get.offAll(()=> const Home(), transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 200));
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
