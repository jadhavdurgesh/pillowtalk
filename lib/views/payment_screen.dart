import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/components/payment_card.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/fonts/fontstyle.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
      body: Column(
        children: [
          Center(
              child: Image.asset(
            "assets/illustration3.png",
            width: 220,
          )),
          32.heightBox,
          Text(
            'Passion is high',
            style: kMontserratMedium.copyWith(fontSize: 20),
          ),
          12.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Continue the conversation and ignite the sparks with premium intimacy card packs.",
              style: kMontserratMedium.copyWith(),
            ),
          ),
          28.heightBox,
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                paymentCard(),
                60.widthBox,
                paymentCard(),
                60.widthBox,
                paymentCard(),
                60.widthBox,
                paymentCard(),
                60.widthBox,
                paymentCard(),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
        ],
      ),
    );
  }
}
