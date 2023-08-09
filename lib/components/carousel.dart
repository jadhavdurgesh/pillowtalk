// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:pillowtalk/constants/lists.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../constants/fonts/fontstyle.dart';

// class SliderDart extends StatefulWidget {

//   SliderDart({super.key,});

//   @override
//   State<SliderDart> createState() => _SliderDartState();
// }

// class _SliderDartState extends State<SliderDart>  with TickerProviderStateMixin {
//   late final CarouselController _carouselController = CarouselController();
//   late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
//   late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//   int index = 0;
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
  
//   final List<String> sliderList = [
//     'assets/card1.png',
//     'assets/card2.png',
//     'assets/card3.png',
//     'assets/card4.png',
//   ];

//   List<Widget> generateImagesTiles() {
//     return sliderList
//         .map((e) => ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.asset(
//                 e,
//                 fit: BoxFit.cover,
//               ),
//             ))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: const EdgeInsets.only(top: 50),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 CarouselSlider(
//                   carouselController: _carouselController,
//                     items: generateImagesTiles(),
//                     options: CarouselOptions(
//                       enlargeCenterPage: true,
//                       aspectRatio: 5/4.5,
//                       enableInfiniteScroll: false,
//                       viewportFraction: 0.57
//                       )),
//               ],
//             ),
//             16.heightBox,
//             FadeTransition(opacity: _animation, child: Column(
//               children: [
//                 Text(
//                   cardStringsList[index],
//                   style: kMontserratMedium.copyWith(
//                     fontSize: 22
//                   ),
//                 ),
//                 16.heightBox,
//                 Text(
//                 descCardLlist[index],
//                   style: kMontserratMedium.copyWith(
//                     fontSize: 16
//                   ),
//                 ),
//               ],
//             ),)
            
//           ],
//         ),
//       ),
//     );
//   }
// }
