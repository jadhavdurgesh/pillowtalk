import 'package:flutter/material.dart';
import 'package:pillowtalk/components/notification_card.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/fonts/fontstyle.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            70.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Today',
                style: kMontserratMedium.copyWith(
                  fontSize: 20
                ),
              ),
            ),
            16.heightBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                ],
              ),
            ),
            const Divider(color: secondaryColor,thickness: 1),
            12.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Yesterday',
                style: kMontserratMedium.copyWith(
                  fontSize: 20
                ),
              ),
            ),
            16.heightBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                ],
              ),
            ),
            const Divider(color: secondaryColor,thickness: 1),
            12.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'August 15',
                style: kMontserratMedium.copyWith(
                  fontSize: 20
                ),
              ),
            ),
            16.heightBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                  Divider(color: secondaryColor,thickness: 1,indent: 5, endIndent: 5,),
                  NotificationCard(),
                ],
              ),
            ),
            const Divider(color: secondaryColor,thickness: 1),
          ],
        ),
      ),
    );
  }
}