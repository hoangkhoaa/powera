import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powera/size_config.dart';
import 'package:powera/ui/screens/settings/color_select_btn.dart';
import 'package:powera/ui/screens/settings/water_timer.dart';
import 'setting_card.dart';

import '../../../constants.dart';

// class TestSettingScafold extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(extendBodyBehindAppBar: true, body: SettingScreen());
//   }
// }

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpacing(
                  of: 60,
                ),
                SvgPicture.asset(
                  "assets/icons/ic_light.svg",
                  color: pItemColorChose,
                  height: getProportionateScreenHeight(50),
                ),
                VerticalSpacing(of: 10),
                SettingCard(
                  lable: "LED light turn on when ",
                  maxVal: 100,
                  minVal: 0,
                  curVal: 10,
                  isActive: true,
                  requestFunction: () {
                    print("Request to turn on/of goes here");
                  },
                  hasAuto: true,
                ),
                VerticalSpacing(
                  of: 20,
                ),
                Text("Chose LED Light color",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold,
                        color: pTextColorGray2,
                        height: 0.5)),
                VerticalSpacing(
                  of: 20,
                ),
                ColorToggleButton(
                  isRed: true,
                ),
                const Divider(
                  color: pItemColorChose,
                  height: 40,
                  thickness: 0.5,
                  indent: 50,
                  endIndent: 50,
                ),
                SvgPicture.asset(
                  "assets/icons/ic_heat.svg",
                  color: pItemColorChose,
                  height: getProportionateScreenHeight(50),
                ),
                VerticalSpacing(of: 10),
                SettingCard(
                  lable: "Water Pumper turn on when: ",
                  maxVal: 100,
                  minVal: 0,
                  curVal: 10,
                  isActive: true,
                  hasAuto: true,
                  requestFunction: () {
                    print("Request to turn on/of goes here");
                  },
                ),
                VerticalSpacing(of: 20),
                SettingCard(
                  lable: "Buzzel Speaker volume: ",
                  hasAuto: false,
                  maxVal: 1023,
                  minVal: 0,
                  curVal: 50,
                  isActive: true,
                  requestFunction: () {
                    print("Request to turn on/of goes here");
                  },
                ),
                const Divider(
                  color: pItemColorChose,
                  height: 40,
                  thickness: 0.5,
                  indent: 50,
                  endIndent: 50,
                ),
                Icon(
                  Icons.grass,
                  color: pItemColorChose,
                  size: getProportionateScreenHeight(50),
                ),
                WaterTimer(),
              ],
            ),
          ),
        ));
  }
}
