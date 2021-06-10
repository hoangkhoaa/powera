import 'package:flutter/material.dart';
import 'package:powera/constants.dart';

class SliderCustom extends StatefulWidget {
  final double curVal;
  final double maxVal;
  final double minVal;
  final int division;
  const SliderCustom(
      {Key key, this.curVal, this.maxVal, this.minVal, this.division = 10})
      : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderCustomState(
      curVal: this.curVal,
      maxVal: this.maxVal,
      minVal: this.minVal,
      division: this.division);
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliderCustomState extends State<SliderCustom> {
  double curVal;
  final double maxVal;

  final double minVal;
  final int division;
  _SliderCustomState(
      {this.curVal = 20,
      this.maxVal = 100,
      this.minVal = 0,
      this.division = 10});
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: curVal,
      min: minVal,
      max: maxVal,
      divisions: this.division,
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
