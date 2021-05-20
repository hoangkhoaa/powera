import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/constants.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powera/bloc/power_button_bloc.dart';
import 'package:powera/ui/screens/device/components/graph.dart';
import 'button.dart';

class DeviceCard extends StatelessWidget {
  final ScreenModel itemdata;
  const DeviceCard({Key key, this.itemdata}) : super(key: key);
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
                itemdata.deviceName,
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
                        itemdata.deviceDis,
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
                  child: BlocProvider(
                    create: (_) => ButtonCubit(),
                    child: BlocBuilder<ButtonCubit, bool>(
                      builder: (context, state) {
                        print("rebuid ButtonCubit");
                        return PowerButton(
                          itemdata: itemdata,
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
