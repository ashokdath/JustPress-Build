import 'package:flutter/cupertino.dart';


class CustomTextWidget extends Text {
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String text;
  final String family;

  CustomTextWidget({
    @required this.text,
    @required this.color,
    @required this.fontWeight,
    @required this.fontSize,
    @required this.family,
  })  : assert(text != null &&
      color != null &&
      fontWeight != null &&
      fontSize != null),
        super(
        text,
        overflow: TextOverflow.clip,

        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: fontWeight,fontFamily: family),
      );
}