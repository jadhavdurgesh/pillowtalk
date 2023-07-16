import 'package:flutter/material.dart';
import 'package:pillowtalk/constants/colors.dart';

import '../constants/fonts/fontstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: darkColor
        ),
      ),
      drawer: const Drawer(
      ),
      body: Column(
        children: [
          Text(
            "Welcome, John & Jane",
            style: kMontserratMedium.copyWith(),
          )
        ],
      )
    );
  }
}