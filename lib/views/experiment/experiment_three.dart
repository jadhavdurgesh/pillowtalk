import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

class ExperimentThree extends StatefulWidget {
  const ExperimentThree({super.key});

  @override
  State<ExperimentThree> createState() => _ExperimentThreeState();
}

class _ExperimentThreeState extends State<ExperimentThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 100.heightBox,
          Center(
            child: Container(
              height: 700,
              width: double.infinity,
              color: secondaryColor,
              child: Swiper(
                itemCount: cardImagesList.length,
                layout: SwiperLayout.STACK,
                axisDirection: AxisDirection.right,
                physics: const NeverScrollableScrollPhysics(),
                itemWidth: 350,
                // allowImplicitScrolling: true,
                itemHeight: 500,
                itemBuilder: (context, index) {
                  return Image.asset(cardImagesList[index], fit: BoxFit.fill,);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
