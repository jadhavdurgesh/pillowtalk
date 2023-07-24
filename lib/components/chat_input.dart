import 'package:flutter/material.dart';

import '../../main.dart';

Widget chatInput({context}) {
  mq = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: mq.width * 0.025,
        vertical: MediaQuery.of(context).size.height * 0.01),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Colors.grey[50],
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions,
                      color: Colors.redAccent,
                      size: 26,
                    )),
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Aa", border: InputBorder.none),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_library_rounded,
                      color: Colors.redAccent,
                      size: 26,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.redAccent,
                      size: 26,
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.01,
                    )
              ],
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          padding:
              const EdgeInsets.only(right: 5, left: 10, top: 10, bottom: 10),
          shape: const CircleBorder(),
          color: Colors.redAccent,
          minWidth: 0,
          child: const Icon(
            Icons.send_rounded,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
