import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/size_config.dart';
import 'device_card.dart';
import 'package:powera/model/Device.dart';

class HomeHeader extends StatelessWidget {
  final Device sender_device;

  const HomeHeader({
    Key key,
    this.sender_device,
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
            "assets/images/pbackground2.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: getProportionateScreenHeight(370),
          ),
          Container(
            width: double.infinity,
            height: getProportionateScreenHeight(370),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(90),
                ),
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
                      "User",
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
          ),
          Positioned(
              bottom: getProportionateScreenHeight(20),
              child: DeviceCard(
                sender_device: sender_device,
              ))
        ],
      ),
    );
  }
}
