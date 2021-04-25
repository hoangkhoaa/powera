import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttributeCard extends StatelessWidget {
  const AttributeCard({Key key}) : super(key: key);
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
                      flex: 4,
                      child: Center(
                        child: Text("Attribute",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.normal,
                                color: pTextColorGray3,
                                height: 1)),
                      )),
                  Flexible(
                    flex: 5,
                    child: Center(
                      child: Text("value",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(17),
                              fontWeight: FontWeight.normal,
                              color: pTextColorGray3,
                              height: 1)),
                    ),
                  )
                ],
              ),
            )));
  }
}
