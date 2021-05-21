import 'package:flutter/material.dart';
import 'package:powera/constants.dart';

class SliderCustom extends StatefulWidget {
  final double curVal;
  final double maxVal;
  final double minVal;
  const SliderCustom({Key key, this.curVal, this.maxVal, this.minVal})
      : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderCustomState(
      curVal: this.curVal, maxVal: this.maxVal, minVal: this.minVal);
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliderCustomState extends State<SliderCustom> {
  double curVal;
  final double maxVal;
  final double minVal;
  _SliderCustomState({this.curVal = 20, this.maxVal = 100, this.minVal = 0});
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: curVal,
      min: 0,
      max: 100,
      divisions: 10,
      activeColor: pItemColorChose,
      label: curVal.round().toString(),
      onChanged: (double value) {
        setState(() {
          curVal = value;
        });
      },
    );
  }
}
