import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Discover Page",
        ),
      ),
    );
  }
}




//  SafeArea(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   "assets/icons/calendar.svg",
//                 ),
//                 8.widthBox,
//                 Text(
//                   "Calendar",
//                   style: kMontserratMedium.copyWith(
//                       fontSize: 20, color: secondaryColor),
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   "assets/icons/journal.svg",
//                 ),
//                 8.widthBox,
//                 Text(
//                   "Journal",
//                   style: kMontserratMedium.copyWith(
//                       fontSize: 20, color: secondaryColor),
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   "assets/icons/calendar.svg",
//                 ),
//                 8.widthBox,
//                 Text(
//                   "Love note",
//                   style: kMontserratMedium.copyWith(
//                       fontSize: 20, color: secondaryColor),
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   "assets/icons/visibility_off.svg",
//                 ),
//                 8.widthBox,
//                 Text(
//                   "Offline mode",
//                   style: kMontserratMedium.copyWith(
//                       fontSize: 20, color: secondaryColor),
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   "assets/icons/settings.svg",
//                 ),
//                 8.widthBox,
//                 Text(
//                   "Settings",
//                   style: kMontserratMedium.copyWith(
//                       fontSize: 20, color: secondaryColor),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ))}