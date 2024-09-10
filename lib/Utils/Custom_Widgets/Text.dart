import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  final String? data;
  final double? size;
  final FontWeight? fontweight;
  final FontStyle? style;
  final Color? color;

   Texts(
      { this.color,
        this.style,
        this.data,
        this.size,
        this.fontweight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data??" ",
      style: TextStyle(
          fontWeight: fontweight,
          fontSize: size,
          fontStyle: style,
          color: color),
    );
  }
}
