import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/colors.dart';

class ExperimentOne extends StatefulWidget {
  const ExperimentOne({super.key});

  @override
  State<ExperimentOne> createState() => _ExperimentOneState();
}

class _ExperimentOneState extends State<ExperimentOne> {
  double _sliderValue = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: const RectangularSliderTrackShape(),
        activeTrackColor: primaryColor,
        inactiveTrackColor: whiteColor,
        trackHeight: 30,
        activeTickMarkColor: primaryColor,
        // inactiveTickMarkColor: secondaryColor,
        thumbColor: primaryColor,
        overlayColor: Colors.transparent,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 2.0),
      ),
      child: Center(
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 8),
          // color: secondaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Text('Intimacy Level'),
                Container(
                  // color: Colors.yellow,
                  width: 310,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Slider(
                      value: _sliderValue,
                      // focusNode: FocusNode(),
                      min: 0,
                      // autofocus: true,
                      max: 10,
                      // activeColor: Colors.transparent,
                      // divisions: 5,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
