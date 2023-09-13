import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillowtalk/components/dialog_box/forget_pass.dart';
import 'package:pillowtalk/main.dart';
import 'package:pillowtalk/services/firebase_auth_methods.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/colors.dart';
import '../buttons/outline_button.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<dynamic> showForgetPasswordDialog() {
    return showGeneralDialog(
        barrierLabel: "Label",
        transitionDuration: const Duration(milliseconds: 250),
        context: context,
        barrierDismissible: true,
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(opacity: a1.value, child: const ForgetPasswordDialog()),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container();
        });
  }


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
    mq = MediaQuery.of(context).size;
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
            padding:
                EdgeInsets.symmetric(vertical: mq.width * 0.05, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Log in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: mq.width * 0.044,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: mq.width * 0.04,
                ),
                Form(
                  key: _formField,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: mq.width * 0.034,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        autofocus: true,
                        cursorColor: secondaryColor,
                        controller: emailController,
                        decoration: const InputDecoration(
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: darkColor)),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: darkColor)),
                            isDense: true),
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
                      SizedBox(
                        height: mq.width * 0.03,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: mq.width * 0.034,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: hidePass ? true : false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (value.length < 6) {
                            return "Password should be more than 6 characters";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: darkColor)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: darkColor)),
                          suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  hidePass = !hidePass;
                                });
                              },
                              child: Container(
                                height: mq.width * 0.05,
                                width: mq.width * 0.08,
                                // color: primaryColor,
                                child: hidePass == true
                                    ? Icon(
                                        Icons.visibility_off_outlined,
                                        size: mq.width * 0.05,
                                      )
                                    : Icon(
                                        Icons.visibility_outlined,
                                        size: mq.width * 0.05,
                                      ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customOutlineButton(
                      context: context,
                      title: "LOGIN",
                      assetName: "assets/icons/arrow.svg",
                      height: mq.width * 0.05,
                      width: mq.width * 0.05,
                      widthbox: 4.0,
                      onPress: () {
                        if (_formField.currentState!.validate()) {
                          loginUser();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: mq.width * 0.03,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showForgetPasswordDialog();
                    },
                    child: Text(
                      "Forget Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          // fontSize: 14,
                          fontSize: mq.width * 0.0325,
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
