import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SomeGraph extends StatelessWidget {
  final double width;
  final double height;
  Color color = Colors.blue;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);
  SomeGraph({this.width = 50, this.height = 50, this.color, this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
