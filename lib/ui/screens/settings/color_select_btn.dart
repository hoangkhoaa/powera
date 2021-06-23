import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/setting_saves.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorToggleButton extends StatefulWidget {
  final bool isRed;
  ColorToggleButton({this.isRed = true});
  @override
  _ColorToggleButtonState createState() => _ColorToggleButtonState(this.isRed);
}

class _ColorToggleButtonState extends State<ColorToggleButton> {
  bool isRed;
  _ColorToggleButtonState(this.isRed);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkResponse(
              onTap: () {
                setState(() {
                  isRed = !isRed;
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 4, color: isRed ? pItemOnColor : Colors.white)),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )),
          InkResponse(
              onTap: () async {
                SharedPreferences prefsTemp = await prefs;
                prefsTemp.setInt('lightColorVale', isRed ? 2 : 1);
                setState(() {
                  isRed = !isRed;
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 4, color: isRed ? Colors.white : pItemOnColor)),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
