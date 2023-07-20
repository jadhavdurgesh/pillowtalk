import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/views/onboarding/onboarding_five.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';
import '../constants/fonts/fontstyle.dart';
import 'outline_button.dart';

class CreateAccountDialog extends StatefulWidget {
  const CreateAccountDialog({super.key});

  @override
  State<CreateAccountDialog> createState() => _CreateAccountDialogState();
}

class _CreateAccountDialogState extends State<CreateAccountDialog> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: backgroundColor),
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: kMontserratMedium.copyWith(fontSize: 18),
                ),
                24.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "First name",
                      style: kMontserratMedium.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 36,
                      child: TextField(
                        controller: firstnameController,
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
                      "Last name",
                      style: kMontserratMedium.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 36,
                      child: TextField(
                        controller: lastnameController,
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
                      "Email",
                      style: kMontserratMedium.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 36,
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
                      height: 36,
                      child: TextField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                          onTap: () {
                          },
                          child: const Icon(
                            Icons.visibility_off_outlined,
                            color: darkColor,
                          ),
                        )),
                      ),
                    )
                  ],
                ),
                16.heightBox,
                RichText(
                  text:
                      TextSpan(style: kMontserratMedium.copyWith(), children: [
                    const TextSpan(
                        text:
                            "By selecting Agree and continue below, I agree to Playdate "),
                    TextSpan(
                        text: "Terms & Conditions",
                        style:
                            kMontserratMedium.copyWith(color: secondaryColor)),
                    const TextSpan(text: " and "),
                    TextSpan(
                        text: "Privacy Policy",
                        style:
                            kMontserratMedium.copyWith(color: secondaryColor)),
                  ]),
                  textAlign: TextAlign.center,
                ),
                24.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customOutlineButton(
                      title: "AGREE AND CONTINUE",
                      assetName: "assets/icons/arrow.svg",
                      height: 22,
                      width: 22,
                      widthbox: 4.0,
                      onPress: () {
                        Get.back();
                        Get.to(() => const OnboardingFiveScreen(), transition: Transition.noTransition);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
