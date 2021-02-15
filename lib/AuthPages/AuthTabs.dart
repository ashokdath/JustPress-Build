import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:justpress/AuthPages/ForgotPasswordPage.dart';
import 'package:justpress/AuthPages/LogInPage.dart';
import 'package:justpress/AuthPages/SignUpPage.dart';
import 'package:justpress/CustomWidgets/NextScreen.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:justpress/HomeScreenTabs.dart';
import 'package:justpress/ProductDetails/ProductDetailPage.dart';
import 'package:rect_getter/rect_getter.dart';


class AuthTabs extends StatefulWidget {
  @override
  _AuthTabsState createState() => _AuthTabsState();
}

class _AuthTabsState extends State<AuthTabs> {

  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;
  bool val=false;

  bool value;



  @override
  void initState() {
    super.initState();
    setState(() {
      value=true;
    });
    initDynamicLinks();
  }

  void initDynamicLinks() async {

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {

            nextScreen(context, ProductDetailPage());
            setState(() {
              value=false;
            });
          }
          setState(() {
            value=false;
          });
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {

      nextScreen(context, ProductDetailPage());
      setState(() {
        value=false;
      });
    }
    setState(() {
      value=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
        length: 3,
        child: value?Scaffold(body: Center(child: CircularProgressIndicator())):Scaffold(
            appBar: val?null:AppBar(
              backgroundColor: Color(int.parse("0xff${DotEnv().env['BG_COLOR_PRIMARY']}")),
              elevation: 0,
              centerTitle: true,
              // leading: Icon(Icons.person_outline),
              // title: Text('DASHBOARD',style: TextStyle(fontSize: 16.0),),
              bottom: PreferredSize(
                  child: TabBar(

                      isScrollable: true,
                      unselectedLabelColor: CustomColors().unSelectedStateColor,
                      labelColor: CustomColors().selectedStateColor,
                      // indicator: Decoration,
                      indicatorColor: Colors.white10,
                      labelStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                          fontFamily: "NeusaBold"
                      ),
                      tabs: [
                        Tab(
                          child: Text('Sign Up')
                        ),
                        Tab(
                          child: Text('Log In'),
                        ),
                        Tab(
                          child: Text('Forgot Password'),
                        ),
                      ]),
                  preferredSize: Size.fromHeight(30.0)),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.add_alert),
                ),
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                RectGetter(
                    key: rectGetterKey,child: SignUpPage(voidCallback: _doSomething)),
                LogInPage(),
                ForgotPassword()
              ],
            )),
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

    final value=await FirebaseMessaging().getToken();
    print(value);
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
    Timer(Duration(seconds: 3), (){
      _onTap();
    });
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