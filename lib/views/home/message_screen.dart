import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/components/message_card.dart';

import '../../constants/colors.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/cross.svg",
            )),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: const MessageCard()
    );
  }
}