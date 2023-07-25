import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/fonts/fontstyle.dart';


class OnBoard {
  final String image, text;

  OnBoard({
    required this.image,
    required this.text,
  });
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.text,
  });

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.86,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.72,
            width: double.infinity,child: Image.asset(image, fit: BoxFit.cover,),
          ),
          const Expanded(child: SizedBox(),),
          Text(
            text,
            style: kMontserratMedium.copyWith(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          const Expanded(child: SizedBox(),),
        ],
      ),
    );
  }
}
