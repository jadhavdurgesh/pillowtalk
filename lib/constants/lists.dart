import 'package:flutter/widgets.dart';
import 'package:pillowtalk/components/onboard_content.dart';
import 'package:pillowtalk/constants/strings.dart';

final urlImages = [
  'https://couplegames.s3.amazonaws.com/Onboarding+Screens/Screen1.png',
  'https://couplegames.s3.amazonaws.com/Onboarding+Screens/Screen2.png',
  'https://couplegames.s3.amazonaws.com/Onboarding+Screens/Screen3.png',
];

const cardImagesList = [
  // icCard10,
  // icCard9,
  // icCard8,
  icCard7,
  icCard6,
  icCard5,
  icCard4,
  icCard3,
  icCard2,
  icCard1,
];
const cardStringsList = [
  stringCard1,
  stringCard2,
  stringCard3,
  stringCard4,
  stringCard4,
  stringCard4,
  stringCard4,
  // stringCard4,
  // stringCard4,
  // stringCard4,
];

const descCardLlist = [
  descCard1,
  descCard2,
  descCard3,
  descCard4,
  descCard4,
  descCard4,
  descCard4,
  // descCard4,
  // descCard4,
  // descCard4,
];

final List<OnBoard> onboardDataList = [
  OnBoard(image: "assets/banner4.png", text: "Connecting with\nyour partner"),
  OnBoard(image: "assets/banner5.png", text: "Deepen\ncommunication"),
  OnBoard(image: "assets/banner6.png", text: "Strengthening\nintimacy"),
];

final List<String> sliderList = [
  'assets/card1.png',
  'assets/card2.png',
  'assets/card3.png',
  'assets/card4.png',
];