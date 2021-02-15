import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return buildListView(context);
  }
}
Widget buildListView(context) {
  return
    Container(
      height: MediaQuery.of(context).size.height*0.35,
      child: ListView.separated(

        separatorBuilder: (context, index) => Divider(
          color: CustomColors().unSelectedStateColor,
        ),
        itemCount:  3,
        itemBuilder: (context, index) =>  Padding(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top:10),
          child: GestureDetector(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:  MediaQuery.of(context).size.height*0.1,
                  width:  MediaQuery.of(context).size.width*0.2,
                  decoration: BoxDecoration(

                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(20),

                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image1.png"), fit: BoxFit.contain)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RatingBar(
                        rating: 4,
                        icon: Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.grey,
                        ),
                        starCount: 5,
                        size: 25,
                        isIndicator: false,
                        allowHalfRating: true,
                        onRatingCallback: (double value,
                            ValueNotifier<bool> isIndicator) {
                          print('Number of stars-->  $value');
                          //change the isIndicator from false  to true ,the       RatingBar cannot support touch event;
                          isIndicator.value = true;
                        },
                        color: Colors.amber,
                      ),
                      CustomTextWidget(

                          text: "title of the job",
                          color: CustomColors().selectedStateColor,
                          fontSize: MediaQuery.of(context).size.height*0.02,
                        family:"NeusaBold",
                          fontWeight: FontWeight.w500,
                      ),
                      // However, you must initially connect the device with the USB cable and it must be

                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: CustomTextWidget(
                            family:"NeusaSemiBold",
                            text: "However, you must initially connect the device with the USB cable and it must be",
                            color: CustomColors().selectedStateColor,
                            fontSize: MediaQuery.of(context).size.height*0.02,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  //);
}