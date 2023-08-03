import 'dart:math';
import 'package:flutter/material.dart';
import '../../screen_ratio.dart';
import 'props.dart';

class DotIndicator extends AnimatedWidget {
  late final Color selectedColor;
  late final Color unselectedColor;
  late final Animatable<Color> background;
  final Props props;
  final double? wf = ScreenRatio.widthRatio;

  DotIndicator({super.key, required this.props}) : super(listenable: props.controller!) {
    selectedColor = props.selectedColor ?? Colors.white;
    unselectedColor = props.unSelectedColor ?? Colors.transparent;
    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: unselectedColor,
          end: selectedColor,
        ) as Animatable<Color>,
      ),
    ]);
  }

  transformValue(index) {
    double value = 0;
    if (props.controller!.hasClients) {
      value = max(
        0.0,
        1.0 -
            ((props.controller!.page ?? props.controller!.initialPage) - index)
                .abs(),
      );
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        height: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[]..addAll(List.generate(
              props.totalPage,
              (int index) => Container(
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: (((props.width! * wf!) / (props.totalPage))
                            .clamp(1.0, 8.0)),
                        width: (((props.width! * wf!) / (props.totalPage))
                            .clamp(1.0, 8.0)),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: selectedColor),
                            color: transformValue(index) > 0.1
                                ? background.evaluate(AlwaysStoppedAnimation(
                                    transformValue(index)))
                                : unselectedColor),
                      ),
                    ),
                  )).toList()),
        ));
  }
}