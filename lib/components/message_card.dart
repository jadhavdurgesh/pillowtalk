import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../main.dart';
import '../constants/colors.dart';
import 'blue_chat.dart';
import 'chat_input.dart';
import 'grey_chat.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        Image.asset("assets/tarot1.png"),
                        const Positioned(
                          left: 84,
                          top: 70,
                          child: SizedBox(
                            width: 240,
                            child: Text(
                              "“What is your best memory of me?”",
                              style:
                                  TextStyle(color: whiteColor, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.heightBox,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Type your answer here. When your partner does the same, you both will see each other response and can continue the conversation. Swipe left to skip this prompt and draw another card.",
                      style: TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ),
                  greyMessage(context: context, text: "Hello"),
                  blueMessage(context: context, text: "Hey!"),
                  greyMessage(
                      context: context,
                      text:
                          "It was the first time we met at Kevin's birthday party. You looked stunning in that red dress. I was shy haha."),
                  blueMessage(
                      context: context,
                      text:
                          "I am still trying to hold my laugh when I think about the first time you met my parent. You were shaking in the car lol."),
                  greyMessage(
                      context: context,
                      text:
                          "Lol I still remember that. Stop laughing at me "),
                  blueMessage(
                      context: context,
                      text:
                          "Not a chance. I like where this is going already. This is the perfect spot to grill ya haha!"),
                  greyMessage(
                      context: context,
                      text:
                          "But your parent love me, so the joke on you. Ha Ha Ha"),
                  16.heightBox,
                  Text(
                    "🎉 5 messages streak. Keep it up",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w300),
                  ),
                  16.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        Image.asset("assets/tarot2.png"),
                        const Positioned(
                          left: 70,
                          top: 40,
                          child: SizedBox(
                            width: 290,
                            child: Text(
                              "“What would you do first if you woke up as your partner?”",
                              style:
                                  TextStyle(color: whiteColor, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  greyMessage(
                      context: context, text: "Lol eww. Haha this is fun."),
                  greyMessage(
                      context: context,
                      text:
                          "Hmm I would check your phone if you been texting other girl lmao"),
                  blueMessage(
                      context: context,
                      text:
                          "You would be disappointed haha. The only other woman I talk to is my mom."),
                  greyMessage(context: context, text: "Lol grow up haha."),
                  blueMessage(
                      context: context, text: "Obviously I am not like you!"),
                  16.heightBox,
                  Text(
                    "🎉 10 messages streak. Keep it up",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w300),
                  ),
                  16.heightBox,
                ],
              ),
            ),
          ),
          chatInput(context: context)
        ],
      ),
    );
  }
}
