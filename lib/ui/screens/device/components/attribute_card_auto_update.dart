import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:powera/model/Device.dart';
import 'package:powera/ui/screens/device/components/attribute_card.dart';

class AutoUpdateAttributeCard extends StatefulWidget {
  AutoUpdateAttributeCard({Key key, this.receiverDevice}) : super(key: key);
  final ReceiverDevice receiverDevice;
  @override
  _AutoUpdateAttributeCardState createState() =>
      _AutoUpdateAttributeCardState(receiverDevice);
}

class _AutoUpdateAttributeCardState extends State<AutoUpdateAttributeCard> {
  String _now;
  Timer _everySecond;
  final ReceiverDevice receiverDevice;
  String data;
  _AutoUpdateAttributeCardState(this.receiverDevice);
  @override
  void initState() {
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();
    data = receiverDevice.data;
    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t) async {
      String newData = await getDeviceforUpdate(receiverDevice.deviceKey);
      if (this.mounted) {
        setState(() {
          data = newData;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AttributeCard(
      attribute: receiverDevice.dataLabel,
      value: data,
      maxValue: receiverDevice.maxValue,
      mintValue: receiverDevice.minValue,
      unit: receiverDevice.unit,
    );
  }
}
