import 'package:flutter/material.dart';
import 'package:powera/ui/screens/device/components/button.dart';
import 'package:powera/ui/screens/settings/slider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SettingCard extends StatefulWidget {
  final String lable;
  final double maxVal;
  final double minVal;
  final double curVal;
  final Function requestFunction;
  bool isActive;
  SettingCard(
      {Key key,
      this.lable,
      this.minVal,
      this.curVal,
      this.maxVal,
      this.isActive,
      this.requestFunction});

  @override
  _SettingCardState createState() => _SettingCardState(this.lable, this.minVal,
      this.curVal, this.maxVal, this.isActive = false, requestFunction);
}

class _SettingCardState extends State<SettingCard> {
  final String lable;
  final double maxVal;
  final double minVal;
  final double curVal;
  final Function requestFunction;
  bool isActive;
  _SettingCardState(this.lable, this.minVal, this.curVal, this.maxVal,
      this.isActive, this.requestFunction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: getProportionateScreenWidth(300),
      decoration: BoxDecoration(
        color: Colors.white,
        border: isActive
            ? Border.all(color: pItemOnColor, width: 3)
            : Border.all(color: pItemOffColor, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Container(
          height: getProportionateScreenHeight(190),
          width: getProportionateScreenWidth(290),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(lable,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold,
                        color: pTextColorGray2,
                        height: 0.5)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      "$minVal",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.bold,
                          color: pTextColorGray2,
                          height: 0.5),
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: SliderCustom(
                      curVal: curVal,
                      maxVal: maxVal,
                      minVal: minVal,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "$maxVal",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.bold,
                          color: pTextColorGray2,
                          height: 0.5),
                    ),
                  ),
                ],
              ),
              ButtonItem(
                isOn: isActive,
                function: () {
                  setState(() {
                    requestFunction();
                    isActive = !isActive;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
