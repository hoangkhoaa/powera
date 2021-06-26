import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/size_config.dart';
import 'button.dart';
import 'package:powera/model/Device.dart';

class DeviceCard extends StatelessWidget {
  final Device sender_device;
  const DeviceCard({Key key, this.sender_device}) : super(key: key);
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
                sender_device.name == "RELAY"
                    ? "Water Pumper"
                    : sender_device.name,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(25),
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
                      width: getProportionateScreenWidth(300),
                      child: Text(
                        sender_device.description,
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
                    child: PowerButton(
                      key: UniqueKey(),
                      sender_device: sender_device,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
