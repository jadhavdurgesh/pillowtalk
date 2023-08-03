import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/views/experiment/codeit.dart';

import 'constants/lists.dart';
late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Size mq;

   @override
  void didChangeDependencies() {
    // Adjust the provider based on the image type
    super.didChangeDependencies();
    precacheImage(const AssetImage("assets/banner1.webp"), context);
    precacheImage(const AssetImage("assets/banner2.webp"), context);
    precacheImage(const AssetImage("assets/banner3.webp"), context);
  }
  
  var currentPage = cardImagesList.length - 1.0;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor),
      ),
      home: const CodeIt(),
    );
  }
}
