import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:justpress/CustomWidgets/CustomAuthButton.dart';
import 'package:justpress/CustomWidgets/CustomTextField.dart';
import 'package:justpress/CustomWidgets/NextScreen.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:justpress/HomeScreenTabs.dart';
import 'package:justpress/authpages/SignUpPage.dart';
import 'package:rect_getter/rect_getter.dart';


class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

       Scaffold(
        backgroundColor: Color(int.parse("0xff${DotEnv().env['BG_COLOR_PRIMARY']}")),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.07,
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
                              customTextField(context,"EMAIL/USERNAME",Icons.email,"NeusaMedium",(value){
                                setState(() {

                                });
                              }),
                              Container(
                                height: 1,
                                color: Colors.black12,
                              ),
                              customTextField(context,"PASSWORD",Icons.lock,"NeusaMedium",(value){
                                setState(() {

                                });
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.07,
                    ),
                    RectGetter(

                        key: rectGetterKey,child: CustomButton(text: "LOG IN", callback: _onTap,textColor: CustomColors().secondaryColor,textSize: MediaQuery.of(context).size.height*0.02,)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),

                    Text("Don't have an account? Swipe right to",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.02, fontFamily: "NeusaSemiBold"

                      ),),
                    InkWell(
                      onTap: (){
                        nextScreenCloseOthers(context, SignUpPage());
                      },
                      child: Text("Create a new account",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*0.02,
                          color: CustomColors().primaryColor, fontFamily: "NeusaSemiBold"
                        ),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),

      _ripple()
      ]
    );
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
        .push(FadeRouteBuilder(page:  HomeScreenTabs(
      currentIndex: 0,
    )))
        .then((_) => setState(() => rect = null));
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