import 'dart:async';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:justpress/Cart/CartScreen.dart';
import 'package:justpress/Cart/CheckOutPage.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:justpress/Home/HomeScreen.dart';
import 'package:justpress/More/MoreScreen.dart';
import 'package:justpress/Profile/ProfileScreen.dart';
import 'package:justpress/Search/SearchScreen.dart';
import 'package:lottie/lottie.dart';

import 'CustomWidgets/NextScreen.dart';

class HomeScreenTabs extends StatefulWidget {
  HomeScreenTabs({
    this.currentIndex,
  });

  int currentIndex;

  @override
  _HomeScreenTabsState createState() => _HomeScreenTabsState();
}

class _HomeScreenTabsState extends State<HomeScreenTabs> {
  bool val = false;

  // final tabs = [
  //   HomeScreen(),
  //   SearchScreen(),
  //   CartScreen( voidCallback:_doSomething() ,),
  //   ProfileScreen(),
  //   MoreScreen()
  // ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: widget.currentIndex == 0
                ? HomeScreen()
                : widget.currentIndex == 1
                    ? SearchScreen()
                    : widget.currentIndex == 2
                        ? CartScreen(
                            voidCallback: () {
                              setState(() {
                                val = true;
                              });
                              // scaleController.forward();
                              Timer(Duration(seconds: 4), () {
                                setState(() {
                                  val = false;
                                });
                                nextScreen(context, CheckOutPage());
                              });
                            },
                          )
                        : widget.currentIndex == 3
                            ? ProfileScreen()
                            : MoreScreen()
            // tabs[widget.currentIndex]
            ),
        bottomNavigationBar: val
            ? null
            : CustomNavigationBar(
                currentIndex: widget.currentIndex,
                strokeColor: CustomColors().primaryColor,
                bubbleCurve: Curves.bounceInOut,
                selectedColor: CustomColors().primaryColor,
                unSelectedColor: CustomColors().selectedStateColor,
                items: [
                  CustomNavigationBarItem(
                    icon: widget.currentIndex == 0
                        ? Icon(
                            Icons.home,
                          )
                        : Icon(Icons.home),
                    title: Text(
                      "Home",
                      style: TextStyle(
                          color: widget.currentIndex == 0
                              ? CustomColors().primaryColor
                              : CustomColors().selectedStateColor),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: widget.currentIndex == 1
                        ? Icon(
                            Icons.search,
                          )
                        : Icon(Icons.search),
                    title: Text(
                      "Search",
                      style: TextStyle(
                          color: widget.currentIndex == 1
                              ? CustomColors().primaryColor
                              : CustomColors().selectedStateColor),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: widget.currentIndex == 2
                        ? Icon(
                            Icons.shopping_cart,
                          )
                        : Icon(Icons.shopping_cart),
                    title: Text(
                      "Cart",
                      style: TextStyle(
                          color: widget.currentIndex == 2
                              ? CustomColors().primaryColor
                              : CustomColors().selectedStateColor),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: widget.currentIndex == 3
                        ? Icon(
                            Icons.person,
                          )
                        : Icon(Icons.perm_identity),
                    title: Text(
                      "Profile",
                      style: TextStyle(
                          color: widget.currentIndex == 3
                              ? CustomColors().primaryColor
                              : CustomColors().selectedStateColor),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: widget.currentIndex == 4
                        ? Icon(
                            Icons.menu,
                          )
                        : Icon(Icons.menu),
                    title: Text(
                      "More",
                      style: TextStyle(
                          color: widget.currentIndex == 4
                              ? CustomColors().primaryColor
                              : CustomColors().selectedStateColor),
                    ),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    widget.currentIndex = index;
                  });
                },
              ),
      ),
      val
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black54,
              child: Center(
                child: Lottie.asset("assets/loading.json"),
              ))
          : Container()
    ]);
  }
}
