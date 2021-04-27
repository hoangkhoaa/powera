import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powera/bloc/power_button_bloc.dart';
import 'package:powera/ui/screens/device/components/graph.dart';
import 'button.dart';

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
                "LED light No.69",
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
                      child: Text(
                        "This is a LED light for a secret club under dragon fruit garden",
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
                        print(state);
                        return Test(
                          isOn: state,
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
