import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:justpress/CustomWidgets/CustomAuthButton.dart';
import 'package:justpress/CustomWidgets/CustomTextField.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse("0xff${DotEnv().env['BG_COLOR_PRIMARY']}")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.07,
              ),



              Container(
                child: Text(
                  "Enter the email address you used to create your account and we will email you a link to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.02, fontFamily: "NeusaSemiBold"
                  ),
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
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
                            customTextField(context,"EMAIL",Icons.email,"NeusaMedium",(value){
                              setState(() {

                              });
                            }),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  CustomButton(text: "SEND EMAIL", callback: null,textColor: CustomColors().secondaryColor,textSize: MediaQuery.of(context).size.height*0.02,)

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
