import 'package:flutter/material.dart';
import 'package:justpress/CustomWidgets/CustomOptions.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/CustomWidgets/MessageAndNotification.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              customMessageAndNotification(context),
              Row(
                children: [

                  Container(
                    height:  MediaQuery.of(context).size.height*0.165,
                    width:  MediaQuery.of(context).size.width*0.35,
                    decoration: BoxDecoration(

                      color: Colors.white,
                        // borderRadius: BorderRadius.circular(20),

                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/image1.png"), fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    width:  MediaQuery.of(context).size.width*0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomTextWidget(
                        color: CustomColors().selectedStateColor,
                        fontSize: MediaQuery.of(context).size.width*0.075,
                        fontWeight: FontWeight.w500,
                        text: "Jane Doe",
                        family:"NeusaBold" ,
                      ),
                      CustomTextWidget(
                        color: CustomColors().selectedStateColor,
                        fontSize: MediaQuery.of(context).size.width*0.051,
                        fontWeight: FontWeight.w400,
                        text: "janedeo@gmail.com",
                        family:"NeusaSemiBold" ,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CustomColors().unSelectedStateColor,
                                width: MediaQuery.of(context).size.width*0.004,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomTextWidget(
                                color: CustomColors().textColor,
                                fontSize: MediaQuery.of(context).size.width*0.04,
                                fontWeight: FontWeight.w800,
                                text: "EDIT PROFILE",
                                family:"NeusaSemiBold" ,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        customOptions("All My Orders", "assets/orders.png",context),
                        customDivider(),
                        customOptions("Pending Shipments","assets/payment.png",context),
                        customDivider(),
                        customOptions("Pending Payments", "assets/pending.png",context),
                        customDivider(),
                        customOptions("Finished Orders", "assets/finished.png",context),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        customOptions("Invite Friends","assets/invite.png",context),
                        customDivider(),
                        customOptions("Customer Support", "assets/customer.png",context),
                        customDivider(),
                        customOptions("Rate Our App", "assets/rating.png",context),
                        customDivider(),
                        customOptions("Make a Suggestion", "assets/suggestion.png",context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




}
