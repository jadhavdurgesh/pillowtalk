import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/components/message_card.dart';
import 'package:pillowtalk/views/home/home.dart';

import '../../constants/colors.dart';
import 'home1.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    // controller.currentNavIndex.value = 0;
                    Get.back(result: () => const Home());
                    Get.offAll(() => const Home(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 200));
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/cross.svg",
                  )),
              backgroundColor: backgroundColor,
              elevation: 0,
            ),
        body: WillPopScope(
            onWillPop: () async {
              // Get.back(result: const Home());
              // Get.to(() => const Home());
              return true;
            },
            child: const MessageCard()),
            
        // body: Center(
        //     child: StreamBuilder(
        //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
        //   builder: (context, snapshot) {
        //     final list = [];
        //     if (snapshot.hasData) {
        //       final data = snapshot.data?.docs;
        //       for (var i in data!) {
        //         print('Data: ${jsonEncode(i.data())}');
        //         list.add(i.data()['name']);
        //       }
        //     }
        //     return Center(
        //       child: ListView.builder(
        //         itemCount: list.length,
        //         itemBuilder: (context, index) {
        //           return Text('Name: ${list[index]}');
        //         },
        //       ),
        //     );
        //   },
        // )),
        );
  }
}
