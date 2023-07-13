import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/views/onboarding/onbaording_four.dart';
import 'package:pillowtalk/views/onboarding/onboarding_one.dart';
import 'package:pillowtalk/views/splashscreen.dart';

import 'views/onboarding/onboarding_five.dart';
import 'views/onboarding/onboarding_three.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor),
      ),
      home: const OnboardingOneScreen(),
    );
  }
}

