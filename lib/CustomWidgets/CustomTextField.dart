

import 'package:flutter/material.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

Widget customTextField(context,String title, IconData icon,String font,Function  value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: MediaQuery.of(context).size.height*0.03,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height*0.03,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.6,
          height: MediaQuery.of(context).size.height*0.06,
          child: TextField(
            // cursorHeight: 30,

            onChanged: value,
            style: TextStyle(
              color: CustomColors().selectedStateColor,
              fontSize: MediaQuery.of(context).size.height*0.02,
                fontFamily: "NeusaSemiBold",


            ),
            decoration: InputDecoration(
              labelText: title,

              labelStyle: TextStyle(
                color:CustomColors().unSelectedStateColor ,
                fontSize: MediaQuery.of(context).size.height*0.02,
                  fontFamily: "NeusaSemiBold"
              ),
              border: InputBorder.none,
            ),
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}
