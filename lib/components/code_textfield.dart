
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

Widget codeTextField({context}){
  return SizedBox(
    height: 68,
    width: 64,
    child: TextField(
      cursorColor: secondaryColor,
      onChanged: (value) {
        if(value.length == 1)
        {
          FocusScope.of(context).nextFocus();
        }
      },
      decoration: const InputDecoration(
        focusColor: secondaryColor,
        hintText: ".",
        hintStyle: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w900,
          color: lightColor
        ),
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    ),
  );
}