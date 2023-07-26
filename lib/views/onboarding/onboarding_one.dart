import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/onboard_content.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/outline_button.dart';
import '../../constants/colors.dart';
import 'onbaording_four.dart';

class OnboardingOneScreen extends StatefulWidget {
  // final Image image1;
  // final Image image2;
  // final Image image3;
  const OnboardingOneScreen({
    super.key,
    // required this.image1,
    // required this.image2,
    // required this.image3
  });

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  // @override
  // void didChangeDependencies() {
  //   precacheImage(widget.image1.image, context);
  //   super.didChangeDependencies();
  // }
  late Image image1;
  late Image image2;
  late Image image3;

  // @override
  // void didChangeDependencies() {
  //   // Adjust the provider based on the image type
  //   super.didChangeDependencies();
  //   precacheImage(image1.image, context);
  //   precacheImage(image2.image, context);
  //   precacheImage(image3.image, context);
  // }

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/banner1.webp");
    image2 = Image.asset("assets/banner2.webp");
    image3 = Image.asset("assets/banner3.webp");
    preCache();
    _pageController = PageController(initialPage: 0);
  }

  Future<void> preCache() async {
    await precacheImage(image1.image, context);
    await precacheImage(image2.image, context);
    await precacheImage(image3.image, context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
        ExpandablePageView.builder(
          animationDuration: const Duration(seconds: 2),
          controller: _pageController,
          itemCount: onboardDataList.length,
          onPageChanged: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                OnboardContent(
                  image: onboardDataList[index].image,
                  text: onboardDataList[index].text,
                ),
              ],
            );
          },
        ),
        customOutlineButton(
          assetName: "assets/icons/arrow.svg",
          title: _pageIndex == onboardDataList.length - 1
              ? "LET'S BEGIN"
              : "CONTINUE",
          height: 20,
          width: 20,
          widthbox: 4.0,
          onPress: () {
            if (_pageIndex == onboardDataList.length - 1) {
              Get.to(() => const OnboardingFourScreen(),
                  transition: Transition.topLevel, duration: const Duration(milliseconds: 100),);
            } else if (_pageIndex == onboardDataList.length - 2) {
              _pageController.jumpToPage(2);
            } else {
              _pageController.jumpToPage(1);
            }
          },
        ), 
            ]),
          ));
  }
}
