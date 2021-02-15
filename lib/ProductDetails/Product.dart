import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

  int val=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          CustomTextWidget(text: "SELECT COLOR", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold"),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.04,
            child: ListView(

              scrollDirection: Axis.horizontal,
              children: [
                circleAvatar(Colors.orange),
                circleAvatar(Colors.red),
                circleAvatar(Colors.yellow),
                circleAvatar(Colors.blue),
                circleAvatar(Colors.green),
                circleAvatar(Colors.pink),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          CustomTextWidget(text: "SELECT SIZE", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold"),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.015,
          ),
          GroupButton(
            selectedColor: Colors.white,
            unselectedColor: Colors.white38,
            selectedTextStyle: TextStyle(color: CustomColors().primaryColor),
            spacing: 10,
            direction: Axis.horizontal,
            onSelected: (index, isSelected) {
              setState(() {
                val = index;
              });
            },
            buttons: [
             "4.5",
              "5.0",
              "5.5",
              "6.5",
              "7.0",
            ],
          ),
        ],
      ),
    );
  }
}


Widget circleAvatar(Color color) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
  );
}
