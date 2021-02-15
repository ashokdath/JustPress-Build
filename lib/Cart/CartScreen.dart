
import 'package:flutter/material.dart';
import 'package:justpress/Cart/CheckOutPage.dart';
import 'package:justpress/CustomWidgets/CustomAuthButton.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/CustomWidgets/MessageAndNotification.dart';
import 'package:justpress/Data.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {

  final VoidCallback voidCallback;

  CartScreen({this.voidCallback,});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {

  int itemCount=1;
  bool val=false;
  bool loading=false;

  AnimationController rippleController;
  AnimationController scaleController;

  // Animation rippleAnimation;
  Animation<int> scaleAnimation;


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    rippleController=AnimationController(duration: Duration(seconds: 1),vsync: this);
    scaleController=AnimationController(duration: Duration(seconds: 1),vsync: this)..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        scaleController.reverse();
        Navigator.push(context, MaterialPageRoute(builder:(_)=>CheckOutPage()));
      }
    });


    scaleAnimation=Tween(end: 30,begin: 1).animate(scaleController);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      body: Stack(
          children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customMessageAndNotification(context),
                CustomTextWidget(
                  family:  "NeusaBold",
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  text: "Cart",
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.79,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    itemCount: Data().item1.length,
                    itemBuilder: (context, index)
                    // {

                      // return SlideTransition(position: _offsetAnimation,child:buildPadding(context, index),);
                      // return SlideAnimation(
                      //   // verticalOffset: 50.0,
                      //   horizontalOffset: 50,
                      //   child: FadeInAnimation(
                      //     child: buildPadding(context, index),
                      //   ),
                      // );
                    // },

                    => buildPadding(context, index),
                  ),
                )
              ],
            ),
          ),
        ),



            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              color: CustomColors().selectedStateColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              text: "Total",
                              family:"NeusaSemiBold" ,
                            ),
                            CustomTextWidget(
                              color: CustomColors().primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              text: "\$ 853",
                              family:"NeusaBold" ,
                            ),
                            CustomTextWidget(
                              color: CustomColors().selectedStateColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              text: "Free Domestic Shipping",
                              family:"NeusaSemiBold"
                            ),
                          ],
                        ),
                      ),


                      // InkWell(
                      //   onTap: (){
                      //     scaleController.forward();
                      //   },
                      //   child: AnimatedBuilder(
                      //     animation: scaleAnimation,
                      //     builder: (context,child){
                      //
                      //       return Transform.scale(scale: scaleAnimation.value.toDouble(),child: Container(
                      //         width: 200,
                      //         child: CustomButton(
                      //           text: "CHECK OUT",
                      //           callback: (){
                      //
                      //             // scaleController.forward();
                      //             // nextScreen(context, CheckOutPage());
                      //           },
                      //           textColor:CustomColors().secondaryColor,textSize: 20,
                      //         ),
                      //       ),);
                      //     },
                      //
                      //   ),
                      // ),

                      CustomButton(
                        text: "CHECK OUT",
                        callback: widget.voidCallback,

    // setState(() {
    // loading=true;
    // });
    // // scaleController.forward();
    // Timer(Duration(seconds: 4),(){
    // setState(() {
    // loading=false;
    // });
    // nextScreen(context, CheckOutPage());
    // });
                        //     (){
                        //   nextScreenCloseOthers(context, HomeScreenTabs(loading: true,currentIndex: 2,));
                        //
                        //
                        // },
                        textColor:CustomColors().secondaryColor,textSize: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),


            loading?Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black54,
              child: Center(
                child: Lottie.asset("assets/loading.json"),
              ))
        :Container()
      ]),
    );
  }



  Padding buildPadding(BuildContext context, int index) {
    return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.13,
                                    width: MediaQuery.of(context).size.width *0.22,
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(20),

                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/image1.png"), fit: BoxFit.contain)),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        color: CustomColors().selectedStateColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        text: "Shoes",
                                          family:"NeusaSemiBold" ,

                                      ),
                                      CustomTextWidget(
                                        color: CustomColors().selectedStateColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        text: Data().item3[index],
                                        family:"NeusaSemiBold" ,
                                      ),
                                      CustomTextWidget(
                                        color:CustomColors().primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        text: Data().item4[index],
                                        family:"NeusaSemiBold" ,
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              child: Icon(Icons.remove),
                                              onTap: () {
                                                itemCount!=1?setState(() {
                                                  itemCount --;
                                                  val=false;

                                                }):setState((){});
                                              },
                                            ),
                                          ),
                                          AnimatedSwitcher(
                                            duration: const Duration(milliseconds: 100),

                                            transitionBuilder: (Widget child, Animation<double> animation) {
                                              return SlideTransition(child: child,position:  new Tween(
                                                begin: val?Offset(0.0, -1.0):Offset(0.0, 1.0),
                                                end:val?Offset(0.0, 0.0): Offset(0.0, 0.0),
                                              ).animate(
                                                  new CurvedAnimation(
                                                    parent: animation,
                                                    curve: Curves.bounceInOut,
                                                  )
                                              ),);
                                            },
                                            child: Text(
                                              '$itemCount',
                                              key: ValueKey<int>(itemCount),
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),

                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              child: Icon(Icons.add),
                                              onTap: () {
                                                setState(() {
                                                  itemCount ++;

                                                  val=true;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
  }
}
