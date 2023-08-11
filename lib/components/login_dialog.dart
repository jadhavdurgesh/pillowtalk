import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/services/firebase_auth_methods.dart';
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

//Login Function
  loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passController.text,
        context: context);
  }

  var hidePass = true;
  final _formField = GlobalKey<FormState>();
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
                  "Log in",
                  textAlign: TextAlign.center,
                  style: kMontserratMedium.copyWith(fontSize: 18),
                ),
                24.heightBox,
                Form(
                  key: _formField,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: kMontserratMedium.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 44,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (value.isEmpty) {
                              return "Enter email";
                            }
                            else if (!emailValid) {
                              return "Enter valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      16.heightBox,
                      Text(
                        "Password",
                        style: kMontserratMedium.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 44,
                        child: TextFormField(
                          controller: passController,
                          obscureText: hidePass ? true : false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else if (value.length < 6) {
                              return "Password length should be more than 6 characters";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                            icon: hidePass == true
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                            color: darkColor,
                            onPressed: () {
                              setState(() {
                                hidePass = !hidePass;
                              });
                            },
                          )),
                        ),
                      ),
                    ],
                  ),
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
                        if(_formField.currentState!.validate()){
                          loginUser();
                        }
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
