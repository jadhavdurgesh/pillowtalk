
import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

import 'experiment_2.dart';

class ExperimentScreen extends StatefulWidget {
  const ExperimentScreen({super.key});

  @override
  State<ExperimentScreen> createState() => _ExperimentScreenState();
}

class _ExperimentScreenState extends State<ExperimentScreen> {
  var currentPage = cardImagesList.length - 1.0;

  get child => null;
  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: cardImagesList.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          50.heightBox,
          Stack(
            children: [
              CardScrollWidget(currentPage: currentPage),
              Positioned.fill(
                  child: PageView.builder(
                itemCount: cardImagesList.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container();
                },
              ))
            ],
          )
        ],
      )),
    );
  }
}

