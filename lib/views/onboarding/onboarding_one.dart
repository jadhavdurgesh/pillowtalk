import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pillowtalk/components/onboard_content.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:pillowtalk/views/home/home_screen.dart';
import 'package:pillowtalk/views/onboarding/onboarding_two.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/outline_button.dart';
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

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
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
      child: Column(children: [
        ExpandablePageView.builder(
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
        28.heightBox,
        customOutlineButton(
          assetName: "assets/icons/arrow.svg",
          title: _pageIndex == onboardDataList.length - 1
              ? "LET'S BEGIN"
              : "CONTINUE",
          height: 20,
          width: 20,
          widthbox: 4.0,
          onPress: () {
            _pageIndex == onboardDataList.length - 1
                ? Get.to(() => const OnboardingFourScreen(), transition: Transition.noTransition)
                : _pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
          },
        )
      ]),
    ));
  }
}
