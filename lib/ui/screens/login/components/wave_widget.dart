import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:powera/ui/screens/login/components/clipper_widget.dart';

class WaveWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final Color color;
  final double waveSpeedTimes;

  WaveWidget({this.size, this.yOffset, this.color, this.waveSpeedTimes = 1});

  @override
  _WaveWidgetState createState() =>
      _WaveWidgetState(waveSpeedTimes: this.waveSpeedTimes);
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> wavePoints = [];
  final double waveSpeedTimes;
  _WaveWidgetState({this.waveSpeedTimes = 1});
  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..addListener(() {
            wavePoints.clear();

            final double waveSpeed = animationController.value * 1080;
            final double fullSphere = animationController.value * Math.pi * 2;
            final double normalizer = Math.cos(fullSphere);
            final double waveWidth = Math.pi / 270;
            final double waveHeight = 20.0;

            for (int i = 0; i <= widget.size.width.toInt(); ++i) {
              double calc = Math.sin((waveSpeed - i) * waveWidth);
              wavePoints.add(
                Offset(
                  i.toDouble(), //X
                  calc * waveHeight * normalizer + widget.yOffset, //Y
                ),
              );
            }
          });

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(
            waveList: wavePoints,
          ),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color,
          ),
        );
      },
    );
  }
}
