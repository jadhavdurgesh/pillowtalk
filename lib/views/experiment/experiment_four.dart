import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

class ExperimentFour extends StatefulWidget {
  const ExperimentFour({super.key});

  @override
  State<ExperimentFour> createState() => _ExperimentFourState();
}

class _ExperimentFourState extends State<ExperimentFour> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
      children: [
        80.heightBox,
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CarouselSlider.builder(
                itemCount: cardImages.length,

                itemBuilder: (context, index, realIndex) {
                  return cardImages[index];
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.4,
                  enableInfiniteScroll: false,
                  enlargeFactor: 0.3,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  // padEnds: false
                  padEnds: true
                )
                )),
      ],
    ));
  }
}
