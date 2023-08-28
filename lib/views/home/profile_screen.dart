import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillowtalk/constants/colors.dart';

import 'home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back(result: () => const Home());
                  },
                  icon: const Icon(Icons.arrow_back, color: darkColor, size: 28,)
                  ),
              backgroundColor: backgroundColor,
              elevation: 0,
            ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}