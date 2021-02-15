import 'package:flutter/material.dart';
import 'package:justpress/CustomWidgets/CategoriesAvatar.dart';
import 'package:justpress/CustomWidgets/CustomOptions.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/Data.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel,
                            size: MediaQuery.of(context).size.height*0.035,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextWidget(
                  color: CustomColors().selectedStateColor,
                  fontSize: MediaQuery.of(context).size.height*0.035,
                  fontWeight: FontWeight.w800,
                  text: "All Categories",
                  family: "NeusaBold",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categoriesAvatar(context, Color(0xFFFFAE4E),
                            Color(0xFFFF7676), Icons.ac_unit, "Apparel"),
                        categoriesAvatar(context, Color(0xFF4EFFF8),
                            Color(0xFF76BAFF), Icons.ac_unit, "Beauty"),
                        categoriesAvatar(context, Color(0xFFB4FF4E),
                            Color(0xFF2FC145), Icons.ac_unit, "Shoe"),
                        categoriesAvatar(context, Color(0xFFD5A3FF),
                            Color(0xFF77A5F8), Icons.ac_unit, "Electronics"),
                        categoriesAvatar(context, Color(0xFFFFF84E),
                            Color(0xFFE6B15C), Icons.ac_unit, "Furniture"),
                        categoriesAvatar(context, Color(0xFFFF74A4),
                            Color(0xFF9F6EA3), Icons.ac_unit, "Home"),
                        categoriesAvatar(context, Color(0xFF9D9E9F),
                            Color(0xFF505862), Icons.ac_unit, "Stationary"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.height*0.017,
                            fontWeight: FontWeight.w800,
                            text: "MEN APPAREL",
                            family: "NeusaSemiBold",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // height: MediaQuery.of(context).size.,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    categoriesOptions(
                                        Data().menApparel[0], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().menApparel[1], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().menApparel[2], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().menApparel[3], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().menApparel[4], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().menApparel[5], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().menApparel[6], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().menApparel[7], context),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.height*0.017,
                            fontWeight: FontWeight.w800,
                            text: "WOMEN APPAREL",
                            family: "NeusaSemiBold",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // height: MediaQuery.of(context).size.height*0.5,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    categoriesOptions(
                                        Data().womenApparel[0], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().womenApparel[1], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().womenApparel[2], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().womenApparel[3], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().womenApparel[4], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().womenApparel[5], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().womenApparel[6], context),
                                    customDivider1(),
                                    categoriesOptions(
                                        Data().womenApparel[7], context),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
