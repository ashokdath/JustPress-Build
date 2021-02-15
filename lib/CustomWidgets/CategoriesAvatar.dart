import 'package:flutter/material.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';

Widget categoriesAvatar(BuildContext context, Color color1, Color color2,
    IconData icon, String string) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(

            shape: BoxShape.circle,
            gradient: LinearGradient(

                colors: [color1, color2],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0)),
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
          ),
          child: Icon(icon),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.005,
        ),
        CustomTextWidget(
          family:"NeusaSemiBold" ,
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          text: string,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
      ],
    ),
  );
}