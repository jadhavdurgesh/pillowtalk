import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/views/onboarding/onboarding_five.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';
import '../constants/fonts/fontstyle.dart';
import 'outline_button.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Dialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: backgroundColor),
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Log in",
                    textAlign: TextAlign.center,
                    style: kMontserratMedium.copyWith(fontSize: 18),
                  ),
                  24.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: kMontserratMedium.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 44,
                        child: TextField(
                          controller: emailController,
                        ),
                      )
                    ],
                  ),
                  16.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: kMontserratMedium.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 44,
                        child: TextField(
                          controller: passController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off_outlined, color: darkColor,)
                          ),
                        ),
                      )
                    ],
                  ),
                  36.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customOutlineButton(
                        title: "LOGIN",
                        assetName: "assets/icons/arrow.svg",
                        height: 22,
                        width: 22,
                        widthbox: 4.0,
                        onPress: () {
                          Get.back();
                          Get.to(()=> const OnboardingFiveScreen(), transition: Transition.noTransition);
                        },
                      ),
                    ],
                  ),
                  24.heightBox,
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forget Password?",
                        textAlign: TextAlign.center,
                        style: kMontserratMedium.copyWith(
                            fontSize: 14,
                            color: secondaryColor,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
  }
}