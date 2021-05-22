import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powera/size_config.dart';
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
                ),
                const Divider(
                  color: pItemColorChose,
                  height: 40,
                  thickness: 0.5,
                  indent: 50,
                  endIndent: 50,
                ),
                VerticalSpacing(
                  of: 20,
                ),
                SvgPicture.asset(
                  "assets/icons/ic_heat.svg",
                  color: pItemColorChose,
                  height: getProportionateScreenHeight(50),
                ),
                VerticalSpacing(of: 10),
                SettingCard(
                  lable: "Water Pumper turn on when ",
                  maxVal: 100,
                  minVal: 0,
                  curVal: 10,
                  isActive: true,
                  requestFunction: () {
                    print("Request to turn on/of goes here");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
