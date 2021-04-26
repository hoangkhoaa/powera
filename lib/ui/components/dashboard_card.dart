import 'package:flutter/material.dart';
import 'package:powera/size_config.dart';
import 'package:powera/constants.dart';

class DashboardCard extends StatelessWidget {
  bool isActive;
  String name;
  DashboardCard({Key key, this.isActive = false, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: isActive ? pItemOnColor : pItemOffColor, width: 2.5)),
      child: Text("asda"),
    );
  }
}
