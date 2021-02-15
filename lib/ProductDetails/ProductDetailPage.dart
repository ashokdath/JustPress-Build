import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:group_button/group_button.dart';
import 'package:justpress/CustomWidgets/CustomAuthButton.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/Data.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:justpress/ProductDetails/Details.dart';
import 'package:justpress/ProductDetails/Product.dart';
import 'package:justpress/ProductDetails/Review.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _current = 0;
  int val = 0;
  double size = 150;
  bool value = false;
  bool com = false;
  bool va = false;
  bool anim = false;

  Widget buildDot(int index, int num) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: (num == index) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: CustomColors().primaryColor,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              CustomTextWidget(
                                family: "neusaBold",
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.height*0.025,
                                fontWeight: FontWeight.w600,
                                text: "Faux Sued Ankle Shoe",
                              ),
                              Row(
                                children: [
                                  CustomTextWidget(
                                    family: "neusaBold",
                                    color: CustomColors().primaryColor,
                                    fontSize: MediaQuery.of(context).size.height*0.02,
                                    fontWeight: FontWeight.w600,
                                    text: "\$45.99",
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.shopping_cart,
                              color: CustomColors().primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: Data().item.map((item) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == Data().item.indexOf(item)
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4)),
                            );
                          }).toList(),
                        ),
                        Stack(alignment: Alignment.center, children: [
                          Container(
                            height: MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width,
                            child: CarouselSlider.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext ctx, int itemIndex) =>
                                  Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                      child: Image(
                                          image:
                                              AssetImage("assets/image1.png"))),
                                ],
                              ),
                              options: CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, select) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                            ),
                          ),
                          value
                              ? Container(
                                  height: MediaQuery.of(context).size.width,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: AnimatedContainer(
                                            onEnd: () {
                                              setState(() {
                                                value = false;
                                                va = false;
                                                com = true;
                                                Timer(
                                                    Duration(milliseconds: 20),
                                                    () {
                                                  setState(() {
                                                    anim = true;
                                                  });
                                                });
                                              });
                                            },
                                            duration: Duration(seconds: 1),
                                            curve: Curves.elasticInOut,
                                            height: va
                                                ? 150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                            width: va
                                                ? 150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                            color: Colors.transparent,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/image1.png"))),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          com
                              ? Container(
                                  height: MediaQuery.of(context).size.width,
                                  width: MediaQuery.of(context).size.width,
                                  child: AnimatedAlign(
                                    onEnd: () {
                                      setState(() {
                                        com = false;
                                        anim = false;
                                      });
                                    },
                                    alignment: anim
                                        ? Alignment.topRight
                                        : Alignment.center,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.linearToEaseOut,
                                    child: SizedBox(
                                      width: 100.0,
                                      height: 100.0,
                                      child: AnimatedContainer(
                                          // onEnd: () {
                                          //   setState(() {
                                          //     com=false;
                                          //
                                          //   });
                                          // },
                                          duration: Duration(seconds: 1),
                                          curve: Curves.elasticInOut,
                                          height: anim ? 50 : 150,
                                          width: anim ? 50 : 150,
                                          color: Colors.transparent,
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/image1.png"))),
                                    ),
                                  ),
                                )
                              : Container(),
                        ]),
                        GroupButton(
                          selectedColor: Colors.white,
                          unselectedColor: Colors.transparent,
                          selectedTextStyle:
                              TextStyle(color: CustomColors().primaryColor),
                          spacing: 10,
                          direction: Axis.horizontal,
                          onSelected: (index, isSelected) {
                            setState(() {
                              val = index;
                            });
                          },
                          buttons: [
                            "Product",
                            "Details",
                            "Review",
                          ],
                        ),
                        val == 0
                            ? Product()
                            : val == 1
                                ? Details()
                                : Review()
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton1(
                  text: "SHARE THIS",
                  callback: () {},
                  textColor: Colors.black,
                  textSize: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.45,
                  icon: Icons.arrow_upward,
                  color: Colors.white,
                ),
                CustomButton1(
                  text: "ADD TO CART",
                  callback: () {
                    setState(() {
                      value = true;
                    });
                    Timer(Duration(milliseconds: 200), () {
                      setState(() {
                        va = true;
                      });
                    });
                  },
                  textColor: Colors.white,
                  textSize: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.45,
                  icon: Icons.arrow_forward,
                  color: Color(int.parse("0xff${DotEnv().env['PRIMARY_CTA']}")),
                ),

                // CustomButton(text: "ADD TO CART", callback: (){}, textColor: Colors.white, textSize: MediaQuery.of(context).size.height*0.015,)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
