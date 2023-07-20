import 'package:flutter/material.dart';
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
    return Column(
      children: [
        Image.asset(image),
        48.heightBox,
        Text(
          text,
          style: kMontserratMedium.copyWith(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
