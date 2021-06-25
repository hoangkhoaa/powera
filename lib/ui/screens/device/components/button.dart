import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/bloc/auto_cubit.dart';
import 'package:powera/bloc/navigation_bloc.dart';
import 'package:powera/constants.dart';
import 'package:powera/model/Device.dart';
import 'package:powera/model/example_db.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/setting_saves.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PowerButton extends StatefulWidget {
  final Device sender_device;
  PowerButton({Key key, this.sender_device}) : super(key: key);
  _PowerButtonState createState() => _PowerButtonState(
      int.parse(sender_device.data) > 0 ? true : false, sender_device);
}

class _PowerButtonState extends State<PowerButton> {
  Device sender_device;
  bool _isOn;
  _PowerButtonState(this._isOn, this.sender_device);
  void initState() {
    super.initState();
    // setupDevice();
  }

  void setupDevice() async {
    // deviceKey = deviceKeyMap[itemdata.deviceName];
    // device = Device(deviceKey);
    // print("Device: " + deviceKey);
    await sender_device.getDevice();
    if (this.mounted) {
      _isOn = int.parse(sender_device.data) > 0 ? true : false;
      await setState(() {
        print("Init status: " + _isOn.toString());
      });
    }
    print(sender_device.data);
  }

  @override
  void didUpdateWidget(PowerButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sender_device.name != widget.sender_device.name) {
      print("Chang button" + widget.sender_device.name);
    }
  }

  void changState() {
    setState(() {
      _isOn = !_isOn;
    });
  }

  void tapFunction() {
    changState();
  }

  @override
  Widget build(BuildContext context) {
    if (sender_device.data == "") {
      return CircularProgressIndicator(
          // valueColor: AlwaysStoppedAnimation(Colors.green),
          );
    }
    if (_isOn) {
      print("State button  " + _isOn.toString());
      return Test(
          child: ButtonItem(
        isOn: true,
        function: () async {
          print(DateTime.now());
          SharedPreferences prefsTemp = await prefs;
          tapFunction();
          print(DateTime.now());
          if (sender_device.deviceKey == "bk-iot-led" &&
              prefsTemp.getBool("lightAuto")) {
            BlocProvider.of<AutoCubit>(context).setAutoOff();
            prefsTemp.setBool("lightAuto", false);
            updateLightSetting();

            // showDialog(
            //     barrierDismissible: false,
            //     context: context,
            //     builder: (_) => new DialogSetAutoOff()).then((value) {
            //   prefsTemp.setBool("lightAuto", false);
            //   updateLightSetting();
            //   BlocProvider.of<AutoCubit>(context).setAutoOff();
            //   Navigator.pop(context);});

          } else if (sender_device.deviceKey == "bk-iot-speaker" &&
              prefsTemp.getBool("heatAuto")) {
            BlocProvider.of<AutoCubit>(context).setAutoOff();
            prefsTemp.setBool("heatAuto", false);
            updateHeatSetting();
          } else if (prefsTemp.getBool("pummerAuto")) {
            BlocProvider.of<AutoCubit>(context).setAutoOff();
            prefsTemp.setBool("pummerAuto", false);
            updateWatterSetting();
          }
          sender_device.updateDevice(sender_device.name, '0', '');
        },
      ));
    } else {
      print("State button " + _isOn.toString());
      return ButtonItem(
          isOn: false,
          function: () async {
            SharedPreferences prefsTemp = await prefs;
            tapFunction();
            if (sender_device.deviceKey == "bk-iot-led") {
              if (prefsTemp.getBool('lightAuto')) {
                BlocProvider.of<AutoCubit>(context).setAutoOff();
                prefsTemp.setBool("lightAuto", false);
                updateLightSetting();
              }
              sender_device.updateDevice(sender_device.name,
                  prefsTemp.getInt('lightColorVale').toString(), '');
            } else if (sender_device.deviceKey == "bk-iot-speaker") {
              if (prefsTemp.getBool("heatAuto")) {
                BlocProvider.of<AutoCubit>(context).setAutoOff();
                prefsTemp.setBool("heatAuto", false);
                updateHeatSetting();
              }
              prefsTemp.setBool("heatAuto", false);
              updateHeatSetting();
              sender_device.updateDevice(sender_device.name,
                  prefsTemp.getInt('heatSpeakerValue').toString(), '');
            } else {
              if (prefsTemp.getBool("pummerAuto")) {
                BlocProvider.of<AutoCubit>(context).setAutoOff();
                prefsTemp.setBool("pummerAuto", false);
                updateWatterSetting();
              }
              sender_device.updateDevice(sender_device.name, '1', '');
              //print(sender_device.name);
            }
          });
    }
  }
}

class ButtonItem extends StatelessWidget {
  final bool isOn;
  final Function function;
  ButtonItem({this.isOn, this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenHeight(70),
      height: getProportionateScreenHeight(70),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            Border.all(color: isOn ? pItemOnColor : pItemOffColor, width: 2.5),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        shadowColor: Colors.black, // button color
        child: InkWell(
          child: Container(
              width: getProportionateScreenHeight(70),
              height: getProportionateScreenHeight(70),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/images/power_on.svg",
                  color: isOn ? pItemOnColor : pItemOffColor,
                  alignment: Alignment.center,
                ),
              )),
          onTap: function,
        ),
      ),
    );
  }
}

/// This class will use for animation template
class Test extends StatefulWidget {
  final Widget child;
  Test({Key key, this.child}) : super(key: key);
  @override
  _TestState createState() => _TestState(button: child);
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  Widget button;
  _TestState({this.button});

  AnimationController _resizableController;

  AnimatedBuilder getContainer() {
    return new AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            child: button,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
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

class DialogSetAutoOff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: new Container(
        alignment: FractionalOffset.center,
        height: 80.0,
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
            new Padding(
              padding: new EdgeInsets.only(left: 10.0),
              child: new Text("Turning off Auto"),
            ),
          ],
        ),
      ),
    );
  }
}
