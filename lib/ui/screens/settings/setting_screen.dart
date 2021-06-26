import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powera/setting_saves.dart';
import 'package:powera/size_config.dart';
import 'package:powera/ui/screens/settings/color_select_btn.dart';
import 'package:powera/ui/screens/settings/water_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setting_card.dart';
import '../../../constants.dart';

// class TestSettingScafold extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(extendBodyBehindAppBar: true, body: SettingScreen());
//   }
// }

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> data = checkSettingSave();
    return SafeArea(
        top: false,
        child: FutureBuilder<Map<String, dynamic>>(
            future: data,
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return Text('error: ${snapshot.error}');
                  } else {
                    print(snapshot.data);
                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            VerticalSpacing(
                              of: 60,
                            ),
                            SvgPicture.asset(
                              "assets/icons/ic_light.svg",
                              color: pItemColorChose,
                              height: getProportionateScreenHeight(50),
                            ),
                            VerticalSpacing(of: 10),
                            SettingCard(
                              cardName: "light",
                              lable: "LED light turn on when ",
                              maxVal: 1023,
                              minVal: 0,
                              curVal:
                                  snapshot.data['lightSensorValue'].toDouble(),
                              isActive: snapshot.data['lightAuto'],
                              setAutoFunction: (bool isAuto) async {
                                SharedPreferences prefsTemp = await prefs;
                                prefsTemp.setBool('lightAuto', isAuto);
                                updateLightSetting();
                              },
                              hasAuto: true,
                            ),
                            VerticalSpacing(
                              of: 20,
                            ),
                            Text("Chose LED Light color",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15),
                                    fontWeight: FontWeight.bold,
                                    color: pTextColorGray2,
                                    height: 0.5)),
                            VerticalSpacing(
                              of: 20,
                            ),
                            ColorToggleButton(
                              isRed: snapshot.data['lightColorVale'] == 1,
                            ),
                            const Divider(
                              color: pItemColorChose,
                              height: 40,
                              thickness: 0.5,
                              indent: 50,
                              endIndent: 50,
                            ),
                            SvgPicture.asset(
                              "assets/icons/ic_heat.svg",
                              color: pItemColorChose,
                              height: getProportionateScreenHeight(50),
                            ),
                            VerticalSpacing(of: 10),
                            SettingCard(
                              cardName: "heat",
                              lable: "Speaker Buzzle turn on when ",
                              maxVal: 50,
                              minVal: 0,
                              curVal:
                                  snapshot.data['heatSensorValue'].toDouble(),
                              isActive: snapshot.data['heatAuto'],
                              hasAuto: true,
                              unit: "°C",
                              setAutoFunction: (bool isAuto) async {
                                SharedPreferences prefsTemp = await prefs;
                                prefsTemp.setBool('heatAuto', isAuto);
                                updateHeatSetting();
                              },
                            ),
                            VerticalSpacing(of: 20),
                            SettingCard(
                              cardName: "speaker",
                              lable: "Buzzel Speaker volume: ",
                              hasAuto: false,
                              maxVal: 1023,
                              minVal: 0,
                              curVal:
                                  snapshot.data['heatSpeakerValue'].toDouble(),
                              isActive: true,
                            ),
                            const Divider(
                              color: pItemColorChose,
                              height: 40,
                              thickness: 0.5,
                              indent: 50,
                              endIndent: 50,
                            ),
                            Icon(
                              Icons.grass,
                              color: pItemColorChose,
                              size: getProportionateScreenHeight(50),
                            ),
                            WaterTimer(
                              startTime: snapshot.data['startTime'],
                              endTime: snapshot.data['endTime'],
                              isOn: snapshot.data['pummerAuto'],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              }
            }));
  }
}
