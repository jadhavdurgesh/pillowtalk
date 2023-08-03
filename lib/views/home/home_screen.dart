import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/components/drawer_widget.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:pillowtalk/constants/lists.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/fonts/fontstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: darkColor),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: SvgPicture.asset("assets/icons/drawer/drawer.svg"));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              width: 24,
            ),
          )
        ],
      ),
      drawer: customDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Welcome, John & Jane",
              style: kMontserratMedium.copyWith(fontSize: 20),
            ),
          ),
          8.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Pick a card",
              style: kMontserratMedium.copyWith(color: greyColor, fontSize: 18),
            ),
          ),
          20.heightBox,
          Container(
            height: 500,
            // color: secondaryColor,
            width: double.infinity,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Positioned(
                  right: 0,
                  top: 70,
                  height: 250,
                  child: Container(
                    color: Colors.yellow,
                    child: Image.asset(
                      'assets/card3.png',
                    ),
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 30,
                  height: 350,
                  child: Container(
                    // color: Colors.green,
                    child: Image.asset(
                      'assets/card2.png',
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  bottom: isExpanded ? 10 : 20,
                  child: Container(
                    // color: primaryColor,
                    child: Positioned(
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.zero,
                        // color: Colors.red,
                        child: GestureDetector(
                          onPanUpdate: onPanUpdate,
                          onTap: (){},
                          child: Image.asset(
                            'assets/card1.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

void onPanUpdate(DragUpdateDetails details){
  if(details.delta.dy < 0){
    setState((){
      isExpanded = true;
    });
  }
  else if(details.delta.dy > 0){
    setState(() {
      isExpanded = false;
    });
  }
}
}
