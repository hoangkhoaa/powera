import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'device_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(25)),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/pbackground.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: getProportionateScreenHeight(250),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: getProportionateScreenWidth(30)),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(30),
                        fontWeight: FontWeight.normal,
                        color: pTextColorGray2,
                        height: 1),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: getProportionateScreenWidth(30)),
                  Text(
                    "Hoang Khoa",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(50),
                        fontWeight: FontWeight.bold,
                        color: pTextColorGray2,
                        height: 0.5),
                  ),
                ],
              )
            ],
          ),
          Positioned(
              bottom: -getProportionateScreenHeight(90), child: DeviceCard())
        ],
      ),
    );
  }
}
