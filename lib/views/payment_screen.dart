import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/views/home/home.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/outline_button.dart';

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
            onPressed: () {
              Get.back(result: ()=> const Home());
            },
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
          const Text(
            'Passion is high',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500),
          ),
          12.heightBox,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              "Continue the conversation and ignite the sparks with premium intimacy card packs.",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
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
                  const Text(
                    "Subscription perks",
                    style: TextStyle(
                        color: secondaryColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                  16.heightBox,
                  const Text(
                    "All Present and future Levels",
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                  ),
                  16.heightBox,
                  const Text(
                    "New levels everymonth",
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                  ),
                  16.heightBox,
                  const Text(
                    "Complete Ad-free experience",
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                  ),
                  16.heightBox,
                  const Text(
                    "Purchases apply to both users",
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                  ),
                  16.heightBox,
                  const Text(
                    "Access to all premimium features in the future",
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                  ),
                  16.heightBox,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        borderRadius: BorderRadius.circular(2)),
                    child: const Text(
                      "Share to partner",
                      style: TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                    ),
                  ),
                  16.heightBox,
                  customOutlineButton(
                    context: context,
                    title: "\$ BILLED YEARLY (BEST VALUE)",
                    assetName: "assets/icons/arrow.svg",
                    widthbox: 8,
                    onPress: () {},
                  ),
                  16.heightBox,
                  customOutlineButton(
                    context: context,
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
