import 'package:flutter/material.dart';
import 'package:pillowtalk/components/outline_button.dart';
import 'dart:math' as math;

class Experiment extends StatefulWidget {
  const Experiment({super.key});

  @override
  State<Experiment> createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: customOutlineButton(
            assetName: '',
            height: 22,
            width: 22,
            title: 'Button',
            onPress: () {
              showDialog(
                  context: context,
                  builder: (_) => Center(
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (_, child) {
                            return Transform.rotate(
                              angle: _controller.value * 2 * math.pi,
                              child: child,
                            );
                          },
                          child: Container(
                              margin: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                "assets/indicator.png",
                                width: 40,
                                height: 40,
                                fit: BoxFit.fitWidth,
                              )),
                        ),
                      ));
            },
            context: context,
          ),
        ),
      ),
    );
  }
}
