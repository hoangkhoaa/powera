import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Device Name",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(30),
                        fontWeight: FontWeight.bold,
                        color: pTextColorGray2,
                        height: 0.5),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Container(
                    width: getProportionateScreenWidth(190),
                    child: Text(
                      "This is a short description about device",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(17),
                          fontWeight: FontWeight.normal,
                          color: pTextColorGray2,
                          height: 1),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: PowerButton(),
              ))
            ],
          ),
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
  bool _isOn = true;
  void changState() {
    setState(() {
      _isOn = !_isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.blue, // button color
        child: InkWell(
          splashColor: Colors.red, // inkwell color
          child: SizedBox(
            width: getProportionateScreenWidth(90),
            height: getProportionateScreenHeight(90),
            child: SvgPicture.asset(
              "assets/icons/ic_light_on.svg",
              color: _isOn ? pItemOnColor : pItemOffColor,
              height: getProportionateScreenHeight(40),
            ),
          ),
          onTap: () {
            changState();
          },
        ),
      ),
    );
  }
}
