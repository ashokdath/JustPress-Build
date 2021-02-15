import 'package:flutter/material.dart';
import 'package:justpress/CustomWidgets/CustomText.dart';
import 'package:justpress/GlobalFiles/CustomColors.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: "BRAND", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold" ,),
              CustomTextWidget(text: "Lily's Ankle Boots", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaMedium" ,),

              SizedBox(
                height: 20,
              ),
              CustomTextWidget(text: "CONDITION", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold" ,),
              CustomTextWidget(text: "Brand New, With Box", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaMedium"),

              SizedBox(
                height: 20,
              ),
              CustomTextWidget(text: "CATEGORY", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold" ,),
              CustomTextWidget(text: "Women Shoes", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaMedium"),
              SizedBox(
                height: 20,
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextWidget(text: "SKU", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold" ,),
              CustomTextWidget(text: "3547635425465234", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaMedium"),
              SizedBox(
                height: 20,
              ),
              CustomTextWidget(text: "MATERIAL", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold" ,),
              CustomTextWidget(text: "Faux Sued, Velvet", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaMedium"),
              SizedBox(
                height: 20,
              ),
              CustomTextWidget(text: "FITTING", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaSemiBold" ,),
              CustomTextWidget(text: "True To Size", color: CustomColors().selectedStateColor, fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.height*0.02,family:"NeusaMedium"),
              SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
