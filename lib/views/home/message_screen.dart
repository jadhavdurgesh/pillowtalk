import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      // body: const MessageCard()
      body: Center(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          final list = [];
          if (snapshot.hasData) {
            final data = snapshot.data?.docs;
            for (var i in data!) {
              print('Data: ${jsonEncode(i.data())}');
              list.add(i.data()['name']);
            }
          }
          return Center(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Text('Name: ${list[index]}');
              },
            ),
          );
        },
      )),
    );
  }
}
