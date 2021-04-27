import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powera/bloc/power_button_bloc.dart';
import 'package:powera/ui/screens/device/components/graph.dart';

class PowerButton extends StatefulWidget {
  PowerButton({
    Key key,
  }) : super(key: key);
  _PowerButtonState createState() => _PowerButtonState();
}

class _PowerButtonState extends State<PowerButton> {
  bool _isOn = false;

  void changState() {
    setState(() {
      _isOn
          ? context.read<ButtonCubit>().turnOff()
          : context.read<ButtonCubit>().turnOn();
      _isOn = !_isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        shadowColor: Colors.black, // button color
        child: InkWell(
          splashColor: _isOn ? pItemOffColor : pItemOnColor, // inkwell color
          child: SizedBox(
              width: getProportionateScreenWidth(80),
              height: getProportionateScreenHeight(80),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/images/power_on.svg",
                  color: _isOn ? pItemOnColor : pItemOffColor,
                  alignment: Alignment.center,
                  height: getProportionateScreenHeight(0),
                ),
              )),
          onTap: () {
            changState();
            _isOn
                ? BlocProvider.of<PowerButtonBloc_Shape>(context)
                    .add(PowerButtonEvents.PowerButtonOfEvent)
                : BlocProvider.of<PowerButtonBloc_Shape>(context)
                    .add(PowerButtonEvents.PowerButtonOnEvent);
          },
        ),
      ),
    );
  }
}

class Test1 extends StatelessWidget {
  final bool isOn;
  Test1({this.isOn});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("$isOn");
  }
}

/// This class will use for animation template
class Test extends StatefulWidget {
  final bool isOn;
  Test({Key key, this.isOn}) : super(key: key);
  @override
  _TestState createState() => _TestState(isOn: isOn);
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  final bool isOn;
  _TestState({this.isOn});
  AnimationController _resizableController;

  AnimatedBuilder getContainer() {
    return new AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            child: PowerButton(),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: pItemOnColor, width: 2.5),
                boxShadow: isOn
                    ? []
                    : [
                        BoxShadow(
                            offset: Offset.fromDirection(20),
                            color: pItemOnColor,
                            blurRadius: 15,
                            spreadRadius: _resizableController.value * 7)
                      ]),
          );
        });
  }

  @override
  void initState() {
    _resizableController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 1000,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }

  @override
  dispose() {
    _resizableController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getContainer();
  }
}
