import 'package:flutter/material.dart';
import 'package:justpress/CustomWidgets/CustomOptions.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/CustomWidgets/MessageAndNotification.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
                family:"NeusaBold" ,
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w800,
                text: "More",
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.width*0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                        customOptions("Shipping Address", "assets/address.png",context),
                        customDivider(),
                        customOptions("Payment Method", "assets/payment.png",context),
                        customDivider(),
                        customOptions("Currency", "assets/currency.png",context),
                        customDivider(),
                        customOptions("Languages", "assets/language.png",context),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.width*0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                        customOptions("Notification Settings", "assets/notification.png",context),
                        customDivider(),
                        customOptions("Privacy Policy", "assets/privacy.png",context),
                        customDivider(),
                        customOptions("Frequently asked questions", "assets/question.png",context),
                        customDivider(),
                        customOptions("Legal Information", "assets/legal.png",context),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height:  MediaQuery.of(context).size.width*0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    family:"NeusaBold" ,
                    color: Color(0xffff6969),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    text: "Log Out",
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }





}