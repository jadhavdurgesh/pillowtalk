import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/outline_button.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              "Continue the conversation and ignite the sparks with premium intimacy card packs.",
              style: kMontserratMedium.copyWith(),
            ),
          ),
          28.heightBox,
          Container(
            // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: yellowColor),
                boxShadow: const [
                  BoxShadow(color: lightColor, blurRadius: 10.0)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Subscription perks",
                    style: kMontserratMedium.copyWith(color: secondaryColor),
                  ),
                  16.heightBox,
                  Text("All Present and future Levels", style: kMontserratMedium),
                  16.heightBox,
                  Text("New levels everymonth", style: kMontserratMedium),
                  16.heightBox,
                  Text("Complete Ad-free experience", style: kMontserratMedium),
                  16.heightBox,
                  Text("Purchases apply to both users", style: kMontserratMedium),
                  16.heightBox,
                  Text("Access to all premimium features in the future", style: kMontserratMedium),
                  16.heightBox,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "Share to partner",
                      style: kRobotoMedium,
                    ),
                  ),
                  16.heightBox,
                  customOutlineButton(
                    title: "\$ BILLED YEARLY (BEST VALUE)",
                    assetName: "assets/icons/arrow.svg",
                    widthbox: 8,
                    onPress: () {},
                  ),
                  16.heightBox,
                  customOutlineButton(
                    title: "\$Y BILLED MONTHLY",
                    assetName: "assets/icons/arrow.svg",
                    widthbox: 8,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.1,
          // ),
        ],
      ),
    );
  }
}
