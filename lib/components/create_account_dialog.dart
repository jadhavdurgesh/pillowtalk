import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillowtalk/utils/showSnackBar.dart';
import 'package:velocity_x/velocity_x.dart';
import '../services/firebase_auth_methods.dart';
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

  var hidePass = true;
  void signUpUser() {
    if (firstnameController.text == '') {
      showSnackBar(context, 'Please enter you name');
    } else if (lastnameController.text == '') {
      showSnackBar(context, 'Please enter your last name');
    } else {
      FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
          email: emailController.text,
          password: passController.text,
          context: context);
    }
  }

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
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: backgroundColor),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.025,
                horizontal: 16),
            child: Form(
              key: _formField,
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
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "First name",
                              style: kMontserratMedium.copyWith(fontSize: 14),
                            ),
                            SizedBox(
                              height: 70,
                              child: TextFormField(
                                decoration: const InputDecoration(),
                                controller: firstnameController,
                                validator: (value) {
                                  bool _nameRegex =
                                      RegExp(r"^[a-zA-Z]+$").hasMatch(value!);
                                  if (value.isEmpty) {
                                    return "Enter Name";
                                  } else if (!_nameRegex) {
                                    return "Enter correct name";
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      16.widthBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Last name",
                              style: kMontserratMedium.copyWith(fontSize: 14),
                            ),
                            SizedBox(
                              height: 70,
                              child: TextFormField(
                                decoration: const InputDecoration(),
                                controller: lastnameController,
                                validator: (value) {
                                  bool _nameRegex =
                                      RegExp(r"^[a-zA-Z]+$").hasMatch(value!);
                                  if (value.isEmpty) {
                                    return "Enter Last Name";
                                  } else if (!_nameRegex) {
                                    return "Enter correct name";
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
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
                        height: 70,
                        child: TextFormField(
                          decoration: const InputDecoration(),
                          controller: emailController,
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (value.isEmpty) {
                              return "Enter email";
                            } else if (!emailValid) {
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
                      // 8.heightBox,
                      Container(
                        height: 72,
                        // color: primaryColor,
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
                            
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    hidePass = !hidePass;
                                  });
                                },
                                child: Container(
                                  height: 20,
                                  // color: primaryColor,
                                  child: hidePass == true
                                      ? const Icon(
                                        Icons.visibility_off_outlined,
                                        size: 22,
                                      )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          size: 22,
                                        ),
                                )),
                            // isDense: true,
                            // suffixIcon: Container(
                            //   height: 0,
                            //   color: primaryColor,
                            //   child: IconButton(
                            //     icon: hidePass == true
                            //         ? const Icon(
                            //             Icons.visibility_off_outlined,
                            //             size: 20,
                            //           )
                            //         : const Icon(
                            //             Icons.visibility_outlined,
                            //             size: 20,
                            //           ),
                            //     color: darkColor,
                            //     onPressed: () {
                            //       setState(() {
                            //         hidePass = !hidePass;
                            //       });
                            //     },
                            //   ),
                            // )
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.heightBox,
                  RichText(
                    text: TextSpan(
                        style: kMontserratMedium.copyWith(),
                        children: [
                          TextSpan(
                              text:
                                  "By selecting Agree and continue below, I agree to PillowTalk ",
                              style: kMontserratMedium.copyWith(
                                  color: greyColor, fontSize: 12)),
                          TextSpan(
                            text: "Terms & Conditions",
                            style: kMontserratMedium.copyWith(
                                color: secondaryColor,
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                              text: " and ",
                              style: kMontserratMedium.copyWith(
                                  color: greyColor, fontSize: 12)),
                          TextSpan(
                              text: "Privacy Policy",
                              style: kMontserratMedium.copyWith(
                                  color: secondaryColor,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline)),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                  16.heightBox,
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
                          if (_formField.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
