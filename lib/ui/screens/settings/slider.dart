import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../setting_saves.dart';
import '../../../size_config.dart';

class SliderCustom extends StatefulWidget {
  final String unit;
  final String name;
  final double curVal;
  final double maxVal;
  final double minVal;
  final int division;
  const SliderCustom({
    Key key,
    this.unit = "",
    this.name,
    this.curVal,
    this.maxVal,
    this.minVal,
    this.division = 10,
  }) : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderCustomState(
      name: this.name,
      unit: this.unit,
      curVal: this.curVal,
      maxVal: this.maxVal,
      minVal: this.minVal,
      division: this.division);
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliderCustomState extends State<SliderCustom> {
  double curVal;
  final String name;
  final String unit;
  final double maxVal;
  final double minVal;
  final int division;
  _SliderCustomState({
    this.unit,
    this.name,
    this.curVal = 20,
    this.maxVal = 100,
    this.minVal = 0,
    this.division = 10,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VerticalSpacing(of: 5),
        Slider(
          value: curVal,
          min: minVal,
          max: maxVal,
          divisions: this.division,
          activeColor: pItemColorChose,
          label: curVal.round().toString(),
          onChanged: (double value) async {
            setState(() {
              curVal = value;
            });
          },
          onChangeEnd: (double value) async {
            SharedPreferences prefsTemp = await prefs;
            switch (this.name) {
              case "light":
                prefsTemp.setInt('lightSensorValue', value.toInt());
                updateLightSetting();
                break;
              case "heat":
                prefsTemp.setInt('heatSensorValue', value.toInt());
                updateHeatSetting();
                break;
              case "speaker":
                prefsTemp.setInt('heatSpeakerValue', value.toInt());
                updateHeatSetting();
                break;
            }
          },
        ),
        VerticalSpacing(of: 15),
        Text(
          "   ${curVal.round()}" + unit,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: pTextColorGray2,
              height: 0.5),
        ),
      ],
    );
  }
}
