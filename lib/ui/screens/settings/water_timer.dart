import 'package:flutter/material.dart';
import 'package:powera/setting_saves.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class WaterTimer extends StatefulWidget {
  final String startTime;
  final String endTime;
  final bool isOn;
  WaterTimer(
      {this.startTime = "07:00", this.endTime = "09:00", this.isOn = true});
  _WaterTimerState createState() => _WaterTimerState(startTime, endTime, isOn);
}

class _WaterTimerState extends State<WaterTimer> {
  String startTime;
  String endTime;
  bool isOn;

  _WaterTimerState(this.startTime, this.endTime, this.isOn);

  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 00, minute: 00));
    if (picked != null) {
      setState(() {
        startTime = picked.hour.toString() +
            " : " +
            (picked.minute < 10
                ? "0" + picked.minute.toString()
                : picked.minute.toString());
      });
      SharedPreferences prefsTemp = await prefs;
      prefsTemp.setString('startTime', startTime);
    }
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 00, minute: 00));
    if (picked != null) {
      setState(() {
        endTime = picked.hour.toString() +
            " : " +
            (picked.minute < 10
                ? "0" + picked.minute.toString()
                : picked.minute.toString());
      });
      SharedPreferences prefsTemp = await prefs;
      prefsTemp.setString('endTime', endTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300),
      decoration: BoxDecoration(
        color: Colors.white,
        border: isOn
            ? Border.all(color: pItemOnColor, width: 3)
            : Border.all(color: pItemOffColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text("Set time auto watering ",
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
              GestureDetector(
                onTap: () {
                  _selectStartTime(context);
                },
                child: Container(
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: pItemColorChose, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      startTime,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.bold,
                          color: pTextColorGray2,
                          height: 0.5),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      _selectEndTime(context);
                    },
                    child: Container(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: pItemColorChose, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          endTime,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              fontWeight: FontWeight.bold,
                              color: pTextColorGray2,
                              height: 0.5),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: getProportionateScreenWidth(240),
              height: getProportionateScreenHeight(50),
              decoration: BoxDecoration(
                color: pItemColorChose,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  updateWatterSetting();
                },
                child: Center(
                  child: Text(
                    "Save new time",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 0.5),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Auto",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold,
                    color: isOn ? pItemOnColor : pItemOffColor,
                    height: 0.5),
              ),
              Switch(
                  activeColor: Colors.white,
                  activeTrackColor: pItemOnColor,
                  inactiveTrackColor: pItemOffColor,
                  value: isOn,
                  onChanged: (bool temp) async {
                    SharedPreferences prefsTemp = await prefs;
                    prefsTemp.setBool('pummerAuto', !isOn);
                    setState(() {
                      isOn = !isOn;
                    });
                    updateWatterSetting();
                  })
            ],
          )
        ],
      ),
    );
  }
}
