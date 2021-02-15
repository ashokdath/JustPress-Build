
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class CustomButton extends InkWell {
  final VoidCallback callback;
  final String text;
  final Color textColor;
  final double textSize;

  CustomButton({
    @required this.text,
    @required this.callback,
    @required this.textColor,
    @required this.textSize,
  })  : assert(text != null),
        super(
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  // color: Colors.white, //background color of box
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(50),
                color: Color(int.parse("0xff${DotEnv().env['PRIMARY_CTA']}")),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      text,
                      style: TextStyle(fontSize: textSize,
                      color: textColor,fontFamily: "NeusaBold"),
                    ),
                    CircleAvatar(
                      backgroundColor: CustomColors().secondaryColor,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(int.parse("0xff${DotEnv().env['PRIMARY_CTA']}")),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          onTap: callback,
        );
}

class CustomButton1 extends InkWell {
  final VoidCallback callback;
  final String text;
  final Color textColor;
  final Color color;
  final double textSize;
  final double width;
  final IconData icon;

  CustomButton1({
    @required this.text,
    @required this.callback,
    @required this.textColor,
    @required this.textSize,
    @required this.width,
    @required this.icon,
    @required this.color,
  })  : assert(text != null),
        super(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              boxShadow: [
                // color: Colors.white, //background color of box
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(50),
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    text,
                    style: TextStyle(fontSize: textSize,
                        color: textColor,fontFamily: "NeusaBold"),
                  ),
                  CircleAvatar(
                    backgroundColor: CustomColors().unSelectedStateColor,
                    child: Icon(
                      icon,
                      // Icons.arrow_upward,
                      color: CustomColors().secondaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: callback,
      );
}
