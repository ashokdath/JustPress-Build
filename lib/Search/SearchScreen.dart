import 'package:flutter/material.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/CustomWidgets/MessageAndNotification.dart';
import 'package:justpress/Data.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List items = [
    "Denim Jeans",
    "Mini Skirts",
    "Jacket",
    "Accessories",
    "SportsAccessories",
    "Yoga Pants",
    "Eyes Shadow",
    "jdshj"
  ];

  Widget wrapList(key) {
    return Wrap(
        runSpacing: 15,
        spacing: 15,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          for (var data in key)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextWidget(
                  text: data,
                  color: CustomColors().selectedStateColor,
                  fontSize: MediaQuery.of(context).size.height*0.02,
                  fontWeight: FontWeight.w500,
                  family: "NeusaSemiBold",
                ),
              ),
            ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customMessageAndNotification(context),
              CustomTextWidget(
                color: CustomColors().selectedStateColor,
                fontSize: MediaQuery.of(context).size.height*0.035,
                fontWeight: FontWeight.w800,
                text: "Search",
                family: "NeusaBold",
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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
                  color: CustomColors().unSelectedStateColor.withOpacity(0.1),
                ),
                child: TextField(
                  textAlign: TextAlign.center,


                  decoration: InputDecoration(

                    hintText: "Search Something",
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.025,
                      fontFamily: "NeusaSemiBold",
                    ),
                    labelStyle: TextStyle(
                      fontSize:  MediaQuery.of(context).size.height*0.025,
                      fontFamily: "NeusaSemiBold",
                    ),
                    border: InputBorder.none,
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    family: "NeusaSemiBold",
                    color: CustomColors().selectedStateColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    text: "RECENTLY VIEWED",
                  ),
                  CustomTextWidget(
                    family: "NeusaSemiBold",
                    color: CustomColors().primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    text: "CLEAR",
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.21,
                color: Colors.transparent,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Data().item1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              // color: Colors.white, //background color of box
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.22,
                                  width: MediaQuery.of(context).size.width *0.22,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(20),

                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image1.png"), fit: BoxFit.contain)),
                                ),


                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      family: "NeusaSemiBold",
                                      color: CustomColors().selectedStateColor,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w400,
                                      text: "Shoes",
                                    ),
                                    CustomTextWidget(
                                      family: "NeusaMedium",
                                      color: CustomColors().primaryColor,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w400,
                                      text: "\$26",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    family: "NeusaSemiBold",
                    color: CustomColors().selectedStateColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    text: "RECOMMENDED",
                  ),
                  CustomTextWidget(
                    family: "NeusaSemiBold",
                    color: CustomColors().primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    text: "REFRESH",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              wrapList(items),
            ],
          ),
        ),
      ),
    );
  }
}
