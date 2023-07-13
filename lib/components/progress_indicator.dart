import 'package:flutter/material.dart';

Widget customCircularProgressIndicator(){
  return Center(
    child: AnimatedRotation(
      turns: 20, 
      curve: Curves.easeIn,
      duration: const Duration( seconds: 10),
      child: Image.asset("assets/icon.png", width: 36,),
      ),
  );
}