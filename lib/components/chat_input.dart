import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pillowtalk/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../main.dart';

Widget chatInput({context}) {
  mq = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: 12, vertical: MediaQuery.of(context).size.height * 0.01),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.widthBox,
        InkWell(
          onTap: () {},
          child: Container(
            // color: secondaryColor,
            height: 40,
            child: SvgPicture.asset('assets/icons/gallery.svg'),
          ),
        ),
        20.widthBox,
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Colors.grey[50],
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: "Aa",
                        border: InputBorder.none),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 40,
                    // color: secondaryColor,
                    child: const Center(
                        child: Text(
                      '😃',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                )
                // Container(
                //   height: 30,
                //   color: secondaryColor,
                //   child: TextButton(onPressed: (){}, child: Text('😃',style: TextStyle(fontSize: 20),)))
                // Container(
                //   height: 10,
                //   child: Image.asset('assets/icons/emoji.svg'),
                // )
              ],
            ),
          ),
        ),
        20.widthBox,
        InkWell(
          onTap: () {},
          child: Container(
            // color: secondaryColor,
            height: 40,
            child: SvgPicture.asset('assets/icons/photo_camera.svg'),
          ),
        ),
        20.widthBox,
        InkWell(
          onTap: () {},
          child: Container(
            // color: secondaryColor,
            height: 40,
            child: SvgPicture.asset('assets/icons/mic.svg'),
          ),
        ),

        // MaterialButton(
        //   onPressed: () {},
        //   padding:
        //       const EdgeInsets.only(right: 5, left: 10, top: 10, bottom: 10),
        //   shape: const CircleBorder(),
        //   color: Colors.redAccent,
        //   minWidth: 0,
        //   child: const Icon(
        //     Icons.send_rounded,
        //     color: Colors.white,
        //   ),
        // )
      ],
    ),
  );
}
