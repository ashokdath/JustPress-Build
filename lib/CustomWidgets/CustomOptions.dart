import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

Widget customOptions(String text, String asset,context) {
  return GestureDetector(
    onTap: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [

            Image(
              image: AssetImage(asset),
              width: MediaQuery.of(context).size.width*0.08,
              height: MediaQuery.of(context).size.width*0.08,

            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.05,
            ),

            CustomTextWidget(
                color: CustomColors().selectedStateColor,
                fontSize: MediaQuery.of(context).size.width*0.05,
                fontWeight: FontWeight.w800,
                text: text,
                family:"NeusaMedium"
            ),
          ],
        ),
        CircleAvatar(
          radius:  MediaQuery.of(context).size.width*0.05,
          backgroundColor: Colors.black12,
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size:  MediaQuery.of(context).size.width*0.05,
            ),
          ),
        )
      ],
    ),
  );
}

Widget categoriesOptions(String text,context) {
  return GestureDetector(
    onTap: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomTextWidget(
              color: CustomColors().selectedStateColor,
              fontSize:  MediaQuery.of(context).size.width*0.05,
              fontWeight: FontWeight.w800,
              text: text,
                family:"NeusaMedium"
            ),
          ],
        ),
        CircleAvatar(
          radius:  MediaQuery.of(context).size.width*0.05,
          backgroundColor: Colors.black12,
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size:  MediaQuery.of(context).size.width*0.05,
            ),
          ),
        )
      ],
    ),
  );
}

Padding customDivider() {
  return Padding(
    padding: const EdgeInsets.only(left: 40, right: 10, top: 7, bottom: 7),
    child: Container(
      height: 1,
      color: Colors.black12,
    ),
  );
}

Padding customDivider1() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
    child: Container(
      height: 1,
      color: Colors.black12,
    ),
  );
}