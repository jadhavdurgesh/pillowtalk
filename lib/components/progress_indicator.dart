import 'package:flutter/material.dart';

Widget customCircularProgressIndicator(){
  return Center(
    child: AnimatedRotation(
      turns: 6, 
      curve: Curves.easeIn,
      duration: const Duration( seconds: 2),
      child: Image.asset("assets/icon.png", width: 36,),
      ),
  );
}