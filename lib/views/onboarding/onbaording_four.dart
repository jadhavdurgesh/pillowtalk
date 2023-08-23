import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/create_account_dialog.dart';
import '../../components/login_dialog.dart';
import '../../components/sign_in_outline_button.dart';
import '../../main.dart';
import '../../services/firebase_auth_methods.dart';
import 'onboarding_five.dart';

class OnboardingFourScreen extends StatefulWidget {
  const OnboardingFourScreen({super.key});

  @override
  State<OnboardingFourScreen> createState() => _OnboardingFourScreenState();
}

class _OnboardingFourScreenState extends State<OnboardingFourScreen> {
  late Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset('assets/illustration1.webp');
  }

  @override
  void didChangeDependencies() {
    //provide the image provider to precached Image
    precacheImage(image.image, context);
    super.didChangeDependencies();
  }

  Future<dynamic> showLoginDialog() {
    return showGeneralDialog(
      barrierLabel: "Label",
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      barrierDismissible: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const LoginDialog();
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

  Future<dynamic> showCreateAccountDialog() {
    return showGeneralDialog(
      barrierLabel: "Label",
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      barrierDismissible: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const CreateAccountDialog();
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: Center(
                  child: Image.asset(
                "assets/illustration1.webp",
                fit: BoxFit.cover,
                // width: 400,
              )),
            ),
            // 24.heightBox,
            Text(
              "Love is in the air",
              style: kMontserratMedium.copyWith(fontSize: 20),
            ),
            14.heightBox,
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      showCreateAccountDialog();
                    },
                    child: SizedBox(
                      height: 24,
                      child: Text(
                        "Create an account",
                        style: kMontserratMedium.copyWith(
                            fontSize: 14,
                            color: secondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    )),
                SizedBox(
                  height: 24,
                  child: Text(
                    " or ",
                    style: kMontserratMedium,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showLoginDialog();
                    },
                    child: SizedBox(
                      height: 24,
                      child: Text(
                        "log in",
                        style: kMontserratMedium.copyWith(
                            color: secondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    )),
              ],
            ),
            20.heightBox,
            customSignInOutlineButton(
              assetName: "assets/icons/google.svg",
              title: "CONTINUE WITH GOOGLE",
              height: 18,
              width: 18,
              widthbox: 16,
              context: context,
              onPress: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInWithGoogle(context);
              },
            ),
            8.heightBox,
            customSignInOutlineButton(
                assetName: "assets/icons/Facebook.svg",
                title: "CONTINUE WITH FACEBOOK",
                height: 20,
                width: 20,
                widthbox: 12,
                context: context),
            8.heightBox,
            customSignInOutlineButton(
              assetName: "assets/icons/apple.svg",
              title: "CONTINUE WITH APPLE",
              height: 20,
              width: 20,
              widthbox: 12,
              context: context,
              onPress: () => Get.offAll(() => const OnboardingFiveScreen(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 200)),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
