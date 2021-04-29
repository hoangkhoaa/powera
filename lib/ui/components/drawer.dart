import 'package:flutter/material.dart';
import 'package:powera/size_config.dart';
import 'package:powera/constants.dart';
import 'package:powera/ui/components/dashboard_card.dart';

class CustomDashboard extends StatelessWidget {
  CustomDashboard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    ExactAssetImage('assets/images/dashboard_background.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(30),
                  0, getProportionateScreenHeight(10)),
              child: Image.asset(
                "assets/images/logo_bk.png",
                height: getProportionateScreenHeight(100),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Orther Devices",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: pTextColorGray2,
                    height: 0.5),
              ),
            ),
            DashboardCard(
                isActive: true,
                name: "Den",
                image: Image.asset("assets/images/light_sensor.jpg")),
            DashboardCard(
                isActive: true,
                name: "Cam bien anh sang",
                image: Image.asset("assets/images/light_sensor.jpg")),
          ],
        ));
  }
}
