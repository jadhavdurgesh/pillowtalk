import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/onboard_content.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:pillowtalk/main.dart';
import 'onbaording_four.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Image image1;
  late Image image2;
  late Image image3;
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
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        _pageController.previousPage(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut);
        if(_pageIndex == 0)
        {
          return true;
        }
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardDataList.length,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardContent(
                      image: onboardDataList[index].image,
                      text: onboardDataList[index].text);
                },
              ),
            ),
            // SizedBox(
            //   height: mq.height*0.01,
            // ),
            customOutlineButton(
              assetName: "assets/icons/arrow.svg",
              title: _pageIndex == onboardDataList.length - 1
                  ? "LET'S BEGIN"
                  : "CONTINUE",
              // height: 20,
              // width: 20,
              widthbox: 4.0,
              onPress: () {
                if (_pageIndex == onboardDataList.length - 1) {
                  Get.to(() => const OnboardingFourScreen(), transition: Transition.rightToLeft,duration: const Duration(milliseconds: 150),);
                } else {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeInOut);
                }
              },
            ),
            SizedBox(
              height: mq.height * 0.08,
            )
          ],
        ),
      ),
    );
  }
}
