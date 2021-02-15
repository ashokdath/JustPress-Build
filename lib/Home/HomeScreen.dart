import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:justpress/CustomWidgets/CategoriesAvatar.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/CustomWidgets/MessageAndNotification.dart';
import 'package:justpress/CustomWidgets/NextScreen.dart';
import 'package:justpress/Data.dart';
import 'package:justpress/FadeAnimation.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:justpress/Home/AllCategories.dart';
import 'package:justpress/ProductDetails/ProductDetailPage.dart';
import 'package:justpress/RemoteConfigFile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    RemoteConfigFile remoteConfig=Provider.of<RemoteConfigFile>(context);
    return Scaffold(
      backgroundColor: Color(int.parse("0xff${DotEnv().env['BG_COLOR_PRIMARY']}")),
      body: remoteConfig.data==null?Center(child: CircularProgressIndicator()):SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customMessageAndNotification(context),
                FadeAnimation(0.5,CustomTextWidget(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height*0.04,
                  fontWeight: FontWeight.w800,
                  text: remoteConfig.data,
                  family:"NeusaBold" ,
                )),

                SizedBox(
                  height: 20,
                ),
                FadeAnimation(1,Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    categoriesAvatar(context, Color(0xFFFFAE4E), Color(0xFFFF7676),
                        Icons.ac_unit, "Apparel"),
                    categoriesAvatar(context, Color(0xFF4EFFF8), Color(0xFF76BAFF),
                        Icons.ac_unit, "Beauty"),
                    categoriesAvatar(context, Color(0xFFB4FF4E), Color(0xFF2FC145),
                        Icons.ac_unit, "Shoe"),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(child:  AllCategories(), type:PageTransitionType.rightToLeft ));
                        // nextScreen(context, AllCategories());
                      },
                      child:Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
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
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.005,
                          ),
                          CustomTextWidget(
                            family:"NeusaSemiBold" ,
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            text: "MORE",
                          ),
                        ],
                      ),
                    ),
                  ],
                )),

                FadeAnimation(1.5,CustomTextWidget(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height*0.04,
                  fontWeight: FontWeight.w800,
                  text: "Latest",
                  family:"NeusaBold" ,
                )),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(2, Container(
                  color: Color(int.parse("0xff${DotEnv().env['BG_COLOR_PRIMARY']}")),
                  height: MediaQuery.of(context).size.height * 0.25,

                  child:
                  ListView.builder
                    (
                      scrollDirection: Axis.horizontal,
                      itemCount: Data().item1.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.22,
                              width: MediaQuery.of(context).size.width *0.7,
                              decoration: BoxDecoration(

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    // color: Colors.white, //background color of box
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15.0, // soften the shadow
                                      spreadRadius: 2.0, //extend the shadow
                                      offset: Offset(
                                        1.0, // Move to right 10  horizontally
                                        1.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image1.png"), fit: BoxFit.contain)),
                            ),
                          ),
                        );
                      }
                  ),
                )),

                FadeAnimation(2.5,Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: (){
                          nextScreen(context, ProductDetailPage());
                        },
                        child: customContainer(context)),
                    customContainer(context),
                    customContainer(context),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.31,
            decoration: BoxDecoration(
                boxShadow: [
                  // color: Colors.white, //background color of box
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: Offset(
                      1.0, // Move to right 10  horizontally
                      1.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              color:Colors.white

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width *0.7,
                  decoration: BoxDecoration(

                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image1.png"), fit: BoxFit.contain)),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        family:"NeusaLight" ,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        text: "Ankle Boots",
                      ),

                      CustomTextWidget(
                        family:"NeusaSemiBold" ,
                        color: CustomColors().primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        text: "\$26",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }


}
