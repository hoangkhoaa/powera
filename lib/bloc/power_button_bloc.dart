import 'package:flutter/material.dart';
import 'package:powera/ui/screens/device/components/graph.dart';
import 'package:bloc/bloc.dart';
import 'dart:math';

enum PowerButtonEvents { PowerButtonOnEvent, PowerButtonOfEvent }

class PowerButtonBloc_Shape extends Bloc<PowerButtonEvents, SomeGraph> {
  PowerButtonBloc_Shape(SomeGraph initialState) : super(initialState);
  @override
  Stream<SomeGraph> mapEventToState(PowerButtonEvents event) async* {
    switch (event) {
      case PowerButtonEvents.PowerButtonOfEvent:
        {
          final random = Random();
          var width = random.nextInt(300).toDouble();
          var height = random.nextInt(300).toDouble();
          Color color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          );
          BorderRadiusGeometry borderRadius =
              BorderRadius.circular(random.nextInt(100).toDouble());
          yield SomeGraph(
              width: width,
              height: height,
              color: color,
              borderRadius: borderRadius);
          break;
        }
      case PowerButtonEvents.PowerButtonOnEvent:
        final random = Random();
        var width = random.nextInt(300).toDouble();
        var height = random.nextInt(300).toDouble();
        Color color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );
        BorderRadiusGeometry borderRadius =
            BorderRadius.circular(random.nextInt(100).toDouble());
        yield SomeGraph(
            width: width,
            height: height,
            color: color,
            borderRadius: borderRadius);
        break;
    }
  }
}
