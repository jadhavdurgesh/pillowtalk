import 'package:flutter/material.dart';

Widget indicatorContainer(double top , double bottom, Color color){
  return Container(
            // color: Colors.yellow,
            height: 60,
            padding: EdgeInsets.only(top: top,bottom: bottom),
            child: Container(
              width: 9,
              decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16)
              ),
            ),
          );
}