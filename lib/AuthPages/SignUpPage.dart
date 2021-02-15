import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:justpress/CustomWidgets/CustomAuthButton.dart';
import 'package:justpress/CustomWidgets/CustomTextField.dart';
import 'package:justpress/CustomWidgets/NextScreen.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:justpress/HomeScreenTabs.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUpPage extends StatefulWidget {
  final Function voidCallback;

  SignUpPage({this.voidCallback,});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;

  String email;
  String name;
  String password;

  // bool val = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor:
            Color(int.parse("0xff${DotEnv().env['BG_COLOR_PRIMARY']}")),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
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
                              customTextField(
                                context,
                                "EMAIL",
                                Icons.email,
                                "NeusaMedium",
                                      (value){
                                    setState(() {
                                      email=value;
                                    });
                                  }
                              ),
                              buildContainer(),
                              customTextField(
                                context,
                                "USERNAME",
                                Icons.perm_identity,
                                "NeusaMedium",
                                      (value){
                                    setState(() {
                                      name=value;
                                    });
                                  }
                              ),
                              buildContainer(),
                              customTextField(
                                context,
                                "PASSWORD",
                                Icons.lock,
                                "NeusaMedium",
                                  (value){
                                  setState(() {
                                    password=value;
                                  });
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: RoundedLoadingButton(
                        color: Color(int.parse("0xff${DotEnv().env['PRIMARY_CTA']}")),

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
                                  "SIGN UP",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,
                                      color: CustomColors().secondaryColor,fontFamily: "NeusaBold"),
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
                        onPressed:
                            ()async{
                          await FirebaseFirestore.instance.collection("user").doc().set({
                            "email":email,
                            "username":name,
                            "password":password
                          }).then((value) => nextScreenCloseOthers(context, HomeScreenTabs(currentIndex: 0,)));
                        }
                        // widget.voidCallback
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      "By continuing, you agree to our ",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontFamily: "NeusaSemiBold"),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Terms of services',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: CustomColors().primaryColor,
                                fontFamily: "NeusaSemiBold"),
                          ),
                        ),
                        Text(
                          ' and ',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: "NeusaSemiBold"
                              // color: Color(0xffff6969)
                              ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Privacy policies',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: CustomColors().primaryColor,
                                fontFamily: "NeusaSemiBold"),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      _ripple()
    ]);
  }

  Widget _ripple() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(int.parse("0xff${DotEnv().env['PRIMARY_CTA']}")),
        ),
      ),
    );
  }

  void _onTap() async {

    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(
            page: HomeScreenTabs(
          currentIndex: 0,
        )))
        .then((_) => setState(() => rect = null));
  }


  Future _doSomething() async {
    Timer(Duration(seconds: 10), (){
      _onTap();
    });
  }

  Container buildContainer() {
    return Container(
      height: 1,
      color: Colors.black12,
    );
  }

}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({@required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}
