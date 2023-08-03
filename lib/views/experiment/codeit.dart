import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/lists.dart';

import 'carousel.dart';

class CodeIt extends StatefulWidget {
  const CodeIt({super.key});

  @override
  State<CodeIt> createState() => _CodeItState();
}

class _CodeItState extends State<CodeIt> {
  @override
  Widget build(BuildContext context) {
    List<String> sliderList = [
      'assets/card1.png',
      'assets/card2.png',
      'assets/card3.png',
      'assets/card4.png',
    ];

    return Scaffold(
      body: Carousel(
        activeIndicatorColor: ,
        allowWrap: ,
          height: 500,
          width: double.infinity,
          type: 'slideSwiper',
          axis: Axis.horizontal,
          showIndicator: false,
          children: List.generate(
              sliderList.length,
              (index) => Center(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(sliderList[index]), fit: BoxFit.cover)),
                    ),
                  ),),),
    );
  }
}
