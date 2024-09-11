import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  final String? data;
  final double? size;
  final FontWeight? fontweight;
  final FontStyle? style;
  final Color? color;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
   Texts(
      { this.color,
        this.style,
        this.data,
        this.size,
        this.fontweight,
        this.leftPadding,
        this.rightPadding,
        this.topPadding,
        this.bottomPadding,
        super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:leftPadding??0,right: rightPadding??0,top: topPadding??0,bottom: bottomPadding??0 ),
      child: Text(data??" ",
        style: TextStyle(
            fontWeight: fontweight,
            fontSize: size,
            fontStyle: style,
            color: color),
      ),
    );
  }
}
