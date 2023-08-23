import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/man.png'),
          ),
          20.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: 'My bunny 🐇 ',
                    style: kMontserratSemibold.copyWith(
                      fontSize: 14
                    )
                  ),
                  TextSpan(
                    text: 'just send you a message',
                    style:  kMontserratRegular.copyWith(
                      fontSize: 14
                    )
                  )
                ]
              )),
              const Text(
                '15 minutes ago',
              )
            ],
          )
        ],
      ),
    );
  }
}