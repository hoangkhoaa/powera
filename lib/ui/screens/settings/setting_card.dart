import 'package:flutter/material.dart';
import 'package:powera/setting_saves.dart';
import 'package:powera/ui/screens/device/components/button.dart';
import 'package:powera/ui/screens/settings/slider.dart';
import 'package:powera/ui/screens/settings/water_timer.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SettingCard extends StatefulWidget {
  final String cardName;
  final String lable;
  final double maxVal;
  final double minVal;
  final double curVal;
  final int devision;
  final bool hasAuto;
  final Function(double value) requestFunction;
  final Function(bool isAuto) setAutoFunction;
  bool isActive;
  SettingCard(
      {Key key,
      this.cardName,
      this.lable,
      this.minVal,
      this.curVal,
      this.maxVal,
      this.devision = 10,
      this.isActive = false,
      this.requestFunction,
      this.setAutoFunction,
      this.hasAuto = true});

  @override
  _SettingCardState createState() => _SettingCardState(
      this.cardName,
      this.lable,
      this.minVal,
      this.curVal,
      this.maxVal,
      this.isActive,
      requestFunction,
      setAutoFunction,
      this.hasAuto,
      this.devision);
}

class _SettingCardState extends State<SettingCard> {
  final String cardName;
  final String lable;
  final double maxVal;
  final int devision;
  final double minVal;
  final double curVal;
  final Function(double value) requestFunction;
  final Function(bool isAuto) setAutoFunction;
  final bool hasAuto;
  bool isActive;
  _SettingCardState(
      this.cardName,
      this.lable,
      this.minVal,
      this.curVal,
      this.maxVal,
      this.isActive,
      this.requestFunction,
      this.setAutoFunction,
      this.hasAuto,
      this.devision);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300),
      decoration: BoxDecoration(
        color: Colors.white,
        border: isActive
            ? Border.all(color: pItemOnColor, width: 3)
            : Border.all(color: pItemOffColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Container(
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
                      "${minVal.toInt()}",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.bold,
                          color: pTextColorGray2,
                          height: 0.5),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: SliderCustom(
                      name: this.cardName,
                      curVal: curVal,
                      maxVal: maxVal,
                      minVal: minVal,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "${maxVal.toInt()}",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.bold,
                          color: pTextColorGray2,
                          height: 0.5),
                    ),
                  ),
                ],
              ),
              // ButtonItem(
              //   isOn: isActive,
              //   function: () {
              //     setState(() {
              //       requestFunction();
              //       isActive = !isActive;
              //     });
              //   },
              // )
              VerticalSpacing(of: 15),
              hasAuto
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Auto",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              fontWeight: FontWeight.bold,
                              color: isActive ? pItemOnColor : pItemOffColor,
                              height: 0.5),
                        ),
                        Switch(
                            activeColor: Colors.white,
                            activeTrackColor: pItemOnColor,
                            inactiveTrackColor: pItemOffColor,
                            value: isActive,
                            onChanged: (bool temp) {
                              setState(() {
                                isActive = !isActive;
                                setAutoFunction(isActive);
                              });
                            })
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
