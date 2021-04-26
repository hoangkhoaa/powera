import 'package:flutter/material.dart';
import 'package:powera/size_config.dart';
import 'package:powera/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardCard extends StatelessWidget {
  final bool isActive;
  final String name;
  DashboardCard({Key key, this.isActive = false, this.name = "null"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: isActive ? pItemOnColor : pItemOffColor, width: 2.5)),
      child: SizedBox(
          width: getProportionateScreenWidth(250),
          height: getProportionateScreenHeight(100),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset("assets/images/light_sensor.jpg"),
                ),
                Flexible(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("Attribute",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(17),
                                  fontWeight: FontWeight.bold,
                                  color: pTextColorGray3,
                                  height: 1)),
                        ),
                        Center(
                          child: Text("Status:",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(17),
                                  fontWeight: FontWeight.normal,
                                  color: pTextColorGray3,
                                  height: 1)),
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
