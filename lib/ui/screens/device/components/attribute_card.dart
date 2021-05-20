import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttributeCard extends StatelessWidget {
  final String attribute;
  final String value;
  final String maxValue;
  final String mintValue;
  const AttributeCard(
      {Key key, this.attribute, this.value, this.maxValue, this.mintValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: pItemColorChose, width: 1.5)),
        child: SizedBox(
            width: getProportionateScreenWidth(327),
            height: getProportionateScreenHeight(50),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: SvgPicture.asset(
                      "assets/icons/ic_attribute2.svg",
                      color: pItemColorChose,
                      alignment: Alignment.center,
                    ),
                  ),
                  Flexible(
                      flex: 5,
                      child: Center(
                        child: Text("$attribute",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.bold,
                                color: pTextColorGray3,
                                height: 1)),
                      )),
                  Flexible(
                    flex: 5,
                    child: Center(
                      child: Text("$value",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(17),
                              fontWeight: FontWeight.bold,
                              color: getValueCorlor(value, maxValue, mintValue),
                              height: 1)),
                    ),
                  )
                ],
              ),
            )));
  }
}

Color getValueCorlor(String val, String maxVal, String minVal) {
  if (val == "On") {
    return pAttributeLowColor;
  } else if (val == "Off") {
    return pAttributeHighColor;
  } else {
    var intVal = int.parse(val);
    var intMaxVal = int.parse(maxVal);
    var intMinVal = int.parse(minVal);
    if (intVal < (intMaxVal + intMinVal) / 3) {
      return pAttributeLowColor;
    } else if (intVal > (intMaxVal + intMaxVal) / 3 * 2) {
      return pAttributeHighColor;
    } else
      return pAttributeMediumColor;
  }
}
