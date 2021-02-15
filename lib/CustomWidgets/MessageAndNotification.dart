import 'package:flutter/material.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'dart:math' as math;

Widget customMessageAndNotification(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){

            },
            child: Stack(
                alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: AssetImage("assets/message.png"),
                  width: MediaQuery.of(context).size.width*0.08,
                  height: MediaQuery.of(context).size.width*0.08,

                ),

                CircleAvatar(
                  backgroundColor: CustomColors().primaryColor,
                  radius:  MediaQuery.of(context).size.width*0.02,
                  child: Text(
                    "4",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.03,
                        fontWeight: FontWeight.w700,
                        color: CustomColors().secondaryColor
                    ),
                  ),
                )]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){

            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: AssetImage("assets/notification.png"),
                  width: MediaQuery.of(context).size.width*0.08,
                  height: MediaQuery.of(context).size.width*0.08,

                ),
              CircleAvatar(
                backgroundColor: CustomColors().primaryColor,
                radius:  MediaQuery.of(context).size.width*0.02,
                child: Text(
                  "4",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.03,
                    fontWeight: FontWeight.w700,
                    color: CustomColors().secondaryColor
                  ),
                ),
              )]
            ),
          ),
        ),
      ],
    ),
  );
}