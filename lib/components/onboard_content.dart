import 'package:flutter/material.dart';
import 'package:pillowtalk/main.dart';


class OnBoard {
  final String image, text;

  OnBoard({
    required this.image,
    required this.text,
  });
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.text,
  });

  final String image, text;

  @override
  Widget build(BuildContext context) {
    mq =  MediaQuery.of(context).size;
    return SizedBox(
      height: mq.height*0.86,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: mq.height*0.72,
            width: double.infinity,child: Image.asset(image, fit: BoxFit.cover,),
          ),
          // SizedBox(
          //   height: mq.height*0.06,
          // ),
          const Expanded(child: SizedBox(),),
          Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: mq.height*0.03,
          )
        ],
      ),
    );
  }
}
