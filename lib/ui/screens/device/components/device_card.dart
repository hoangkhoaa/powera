import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powera/bloc/power_button_bloc.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: pItemColorChose, width: 1.5)),
      child: SizedBox(
        width: getProportionateScreenWidth(327),
        height: getProportionateScreenHeight(140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Device Name",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: pTextColorGray2,
                    height: 0.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 5.0, 5.0),
                    child: Container(
                      child: Text(
                        "This is a short description about device",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(17),
                            fontWeight: FontWeight.normal,
                            color: pTextColorGray3,
                            height: 1),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: PowerButton(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
      _isOn = !_isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white70,
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
                ? BlocProvider.of<PowerButtonBloc>(context)
                    .add(PowerButtonEvents.PowerButtonOfEvent)
                : BlocProvider.of<PowerButtonBloc>(context)
                    .add(PowerButtonEvents.PowerButtonOnEvent);
          },
        ),
      ),
    );
  }
}
