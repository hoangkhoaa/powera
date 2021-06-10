import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';

class DashboardCardInfor extends StatelessWidget {
  String disc;
  String img;
  String name;
  DashboardCardInfor({this.name, this.img, this.disc});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: getProportionateScreenWidth(250),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: pItemOnColor, width: 3.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              img,
              height: getProportionateScreenHeight(75),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.bold,
                color: pItemOnColor,
                height: 1),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              disc,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  fontWeight: FontWeight.bold,
                  color: pTextColorGray2,
                  height: 1),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
