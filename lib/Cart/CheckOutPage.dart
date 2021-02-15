import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/CustomWidgets/NextScreen.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';
import 'package:justpress/HomeScreenTabs.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  bool isSwitched = false;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _demoNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, 'Hello,', 'A message from flutter', platformChannelSpecifics,
        payload: 'test payload');
  }

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('Notification payload: $payload');
    }
    await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => HomeScreenTabs(
                  currentIndex: 0,
                )));
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Ok'),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreenTabs(
                                  currentIndex: 0,
                                )));
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors().secondaryColor,
        leading: GestureDetector(
          onTap: () {
            nextScreenCloseOthers(
                context,
                HomeScreenTabs(
                  currentIndex: 2,
                ));
          },
          child: Icon(
            Icons.arrow_back,
            color: CustomColors().selectedStateColor,
          ),
        ),
        title: CustomTextWidget(
          color: CustomColors().selectedStateColor,
          fontSize: MediaQuery.of(context).size.width * 0.075,
          fontWeight: FontWeight.w500,
          text: "Payment",
          family: "NeusaBold",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                color: CustomColors().secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              CustomTextWidget(
                                color: CustomColors().selectedStateColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.w600,
                                text: "Shipping Address",
                                family: "NeusaMedium",
                              ),
                            ],
                          ),
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w600,
                            text: "Edit",
                            family: "NeusaMedium",
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 7, bottom: 7),
                        child: Container(
                          height: 1,
                          color: Colors.black12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              color: CustomColors().selectedStateColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.075,
                              fontWeight: FontWeight.w600,
                              text: "Kylie",
                              family: "NeusaBold",
                            ),
                            CustomTextWidget(
                              color: CustomColors().selectedStateColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w600,
                              text: "California Street, Blok 4F No.9",
                              family: "NeusaMedium",
                            ),
                            CustomTextWidget(
                              color: CustomColors().selectedStateColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w600,
                              text: "San Fransisco",
                              family: "NeusaMedium",
                            ),
                            CustomTextWidget(
                              color: CustomColors().selectedStateColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w600,
                              text: "California",
                              family: "NeusaMedium",
                            ),
                            CustomTextWidget(
                              color: CustomColors().selectedStateColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w600,
                              text: "0214-0000-0000",
                              family: "NeusaMedium",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                color: CustomColors().secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.22,
                        decoration: BoxDecoration(
                            color: CustomColors().unSelectedStateColor,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/image1.png"),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w600,
                            text: "Levi’s Jeans",
                            family: "NeusaMedium",
                          ),
                          Row(
                            children: [
                              CustomTextWidget(
                                color: CustomColors().selectedStateColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                fontWeight: FontWeight.w600,
                                text: "Color : Dark Grey",
                                family: "NeusaMedium",
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 2,
                                  height:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: CustomColors().unSelectedStateColor,
                                ),
                              ),
                              CustomTextWidget(
                                color: CustomColors().selectedStateColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                fontWeight: FontWeight.w600,
                                text: "Size : L",
                                family: "NeusaMedium",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomTextWidget(
                                color: CustomColors().selectedStateColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.w500,
                                text: "\$76",
                                family: "NeusaBold",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                              ),
                              CustomTextWidget(
                                color: CustomColors().selectedStateColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.w500,
                                text: "x2",
                                family: "NeusaSemiBold",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                color: CustomColors().secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w500,
                            text: "Delivery Service",
                            family: "NeusaMedium",
                          ),
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500,
                            text: "Edit",
                            family: "NeusaMedium",
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 7, bottom: 7),
                        child: Container(
                          height: 1,
                          color: Colors.black12,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w500,
                            text: "Express Delivery",
                            family: "NeusaBold",
                          ),
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500,
                            text: "\$2",
                            family: "NeusaSemiBold",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                color: CustomColors().secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w500,
                            text: "Payment Method",
                            family: "NeusaMedium",
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: CustomColors().primaryColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              CustomTextWidget(
                                color: CustomColors().primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w500,
                                text: "My Pay",
                                family: "NeusaMedium",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.03,
                                backgroundColor:
                                    CustomColors().unSelectedStateColor,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 7, bottom: 7),
                        child: Container(
                          height: 1,
                          color: Colors.black12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildRow(
                                context, "Subtotals for products", "\$152"),
                            buildRow(context, "Subtotals for shipping", "\$2"),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextWidget(
                                  color: CustomColors().selectedStateColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  text: "Total Payment",
                                  family: "NeusaSemiBold",
                                ),
                                CustomTextWidget(
                                  color: CustomColors().selectedStateColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  text: "\$154",
                                  family: "NeusaSemiBold",
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                color: CustomColors().secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w500,
                            text: "Send As a Dropshipper",
                            family: "NeusaMedium",
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeTrackColor: Colors.lightBlueAccent,
                            activeColor: Colors.lightBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                color: CustomColors().secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w800,
                            text: "Total",
                            family: "NeusaMedium",
                          ),
                          CustomTextWidget(
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w800,
                            text: "\$154",
                            family: "NeusaMedium",
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Dialogs.bottomMaterialDialog(
                                color: Colors.white,
                                msg: 'Congratulations, you won 500 points',
                                title: 'Congratulations',
                                animations: 'assets/congratulation.json',
                                context: context,
                                actions: [
                                  IconsButton(
                                    onPressed: () {
                                      _demoNotification().then((value) => nextScreenCloseOthers(context, HomeScreenTabs(currentIndex: 2,)));
                                      // _showNotification();
                                      // Navigator.pop(context);
                                    },
                                    text: 'Claim',
                                    iconData: Icons.done,
                                    color: Colors.blue,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  ),
                                ]);
                          },
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
                              color: CustomColors().primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      color: CustomColors().secondaryColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.w900,
                                      text: "BUY NOW",
                                      family: "NeusaMedium",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow(BuildContext context, String content, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          color: CustomColors().selectedStateColor,
          fontSize: MediaQuery.of(context).size.width * 0.04,
          fontWeight: FontWeight.w500,
          text: content,
          family: "NeusaMedium",
        ),
        CustomTextWidget(
          color: CustomColors().selectedStateColor,
          fontSize: MediaQuery.of(context).size.width * 0.04,
          fontWeight: FontWeight.w500,
          text: price,
          family: "NeusaMedium",
        ),
      ],
    );
  }
}
