import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/bloc/auto_cubit.dart';
import 'package:powera/model/Device.dart';
import 'package:powera/model/example_db.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/setting_saves.dart';
import 'package:powera/ui/screens/device/components/head_body.dart';
import 'package:powera/size_config.dart';
import 'package:powera/ui/screens/device/components/select_chart.dart';
import 'package:powera/ui/screens/device/device_screen.dart';
import 'package:powera/ui/screens/settings/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'attribute_card.dart';
import 'package:powera/bloc/power_button_bloc.dart';
import 'package:powera/bloc/navigation_bloc.dart';
import 'package:powera/model/example_db.dart';
import 'graph.dart';

// class BodyBloc extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => BlocProvider<NavBloc>(
//         create: (BuildContext context) => NavBloc(NavState(NavItem.light_page)),
//         child: BlocBuilder<NavBloc, NavState>(
//             builder: (BuildContext context, NavState state) {
//           switch (state.selectedItem) {
//             case NavItem.heat_page:
//               {
//                 return Body(state, dataDB['heat'][0]);
//               }
//               break;
//             case NavItem.light_page:
//               {
//                 return Body(state, dataDB['light'][0]);
//               }
//               break;
//             case NavItem.humid_page:
//               {
//                 return Body(state, dataDB['humid'][0]);
//               }
//               break;
//             case NavItem.setting_page:
//               {
//                 return Body(state, dataDB['light'][0]);
//               }
//               break;
//             default:
//               {}
//               break;
//           }
//           return Body(state, dataDB['light'][0]);
//         }),
//       );
// }

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page

    SizeConfig().init(context);
    return BlocBuilder<NavBloc, NavState>(builder: (context, state) {
      print("rebuild BODY");
      return FutureBuilder(
          future: getDevices(state),
          builder: (context, snapshot) {
            // bool isLoaded = false;
            if (state.selectedItem == NavItem.setting_page) {
              return SettingScreen();
            }
            if (snapshot.data != null) {
              print(state.selectedItem);
              print("Snapshot data: " + snapshot.data.toString());
              print("Current device: " + snapshot.data[0].deviceKey);
              List<Device> lstDevices;
              SenderDevice sender_device;
              ReceiverDevice receiver_device;
              if (snapshot.data[0].deviceKey ==
                  deviceKeyMapByNavState[state.selectedItem]["SenderDevice"]) {
                List<Device> lstDevices = snapshot.data;
                sender_device = lstDevices[0];
                receiver_device = lstDevices[1];
              } else {
                sender_device = SenderDevice(
                    deviceKeyMapByNavState[state.selectedItem]["SenderDevice"]);
                receiver_device = ReceiverDevice(
                    deviceKeyMapByNavState[state.selectedItem]
                        ["ReceiverDevice"]);
              }

              return FutureBuilder(
                  future: getAutoByDeviceKey(receiver_device.deviceKey),
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    return BlocProvider<AutoCubit>(
                        create: (context) {
                          print("Snapshot : " + snapshot.data.toString());
                          return AutoCubit(snapshot.data);
                        },
                        child: SafeArea(
                            top: false,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                HomeHeader(
                                  // itemData: getScreenModleFollowState(state)
                                  sender_device: sender_device,
                                ),
                                BlocBuilder<AutoCubit, bool>(
                                    builder: (context, isAuto) {
                                  return ListAttributeCard(
                                    sender_device: sender_device,
                                    receiver_device: receiver_device,
                                  );
                                }),
                                SelectChart(
                                  key: UniqueKey(),
                                  deviceKey: receiver_device.deviceKey,
                                )
                              ],
                            )));
                    // switch (snapshot.connectionState) {
                    //   case ConnectionState.waiting:
                    //     return const CircularProgressIndicator();
                    //   default:
                    //     if (snapshot.hasError) {
                    //       return Text("error + ${snapshot.error}");
                    //     } else {
                    //       return BlocProvider<AutoCubit>(
                    //           create: (context) {
                    //             //print("Snapshot : " + snapshot.data.toString());
                    //             return AutoCubit(snapshot.data);
                    //           },
                    //           child: SafeArea(
                    //               top: false,
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.center,
                    //                 children: [
                    //                   HomeHeader(
                    //                     // itemData: getScreenModleFollowState(state)
                    //                     sender_device: sender_device,
                    //                   ),
                    //                   BlocBuilder<AutoCubit, bool>(
                    //                       builder: (context, isAuto) {
                    //                     return ListAttributeCard(
                    //                       sender_device: sender_device,
                    //                       receiver_device: receiver_device,
                    //                     );
                    //                   }),
                    //                   SelectChart(
                    //                     key: UniqueKey(),
                    //                     deviceKey: receiver_device.deviceKey,
                    //                   )
                    //                 ],
                    //               )));
                    //     }
                    // }
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }

            // if (lstDevices == null) {
            //   return Loading
            // }
          });
    });
  }
}

class ListAttributeCard extends StatelessWidget {
  List<AttributeModel> attributeList;
  final SenderDevice sender_device;
  final ReceiverDevice receiver_device;
  //final bool isAutoAttribute;

  ListAttributeCard({this.sender_device, this.receiver_device}) {
    this.attributeList = [
      // AttributeModel(attribute: 'Status', value: sender_device.data == 'ON' ? 'On' : 'Off'),
      // receiver_device.attribute,
      AttributeModel(
          attribute: receiver_device.dataLabel,
          value: receiver_device.data,
          minValue: receiver_device.minValue,
          maxValue: receiver_device.maxValue,
          unit: receiver_device.unit),
    ];
  }
  @override
  Widget build(BuildContext context) {
    // return Container(
    //     width: getProportionateScreenWidth(320),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         AttributeCard(
    //           attribute: attributeList[0].attribute,
    //           value: attributeList[0].value,
    //           unit: attributeList[0].unit,
    //           maxValue: attributeList[0].maxValue,
    //           mintValue: attributeList[0].minValue,
    //         ),
    //         VerticalSpacing(
    //           of: 10,
    //         ),
    //         AttributeCard(
    //           attribute: "Auto",
    //           value: isAutoAttribute ? "On" : "Off",
    //           unit: "",
    //         ),
    //         VerticalSpacing(
    //           of: 10,
    //         ),
    //       ],
    //     ));
    Future<SharedPreferences> prefsTemp = prefs;
    return FutureBuilder<SharedPreferences>(
        future: prefsTemp,
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('error: ${snapshot.error}');
              } else {
                bool isAuto = false;
                if (receiver_device.deviceKey == "bk-iot-light") {
                  isAuto = snapshot.data.getBool('lightAuto');
                } else if (receiver_device.deviceKey == "bk-iot-temp") {
                  isAuto = snapshot.data.getBool('heatAuto');
                } else {
                  isAuto = snapshot.data.getBool('pummerAuto');
                }
                return Container(
                    width: getProportionateScreenWidth(320),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AttributeCard(
                          attribute: attributeList[0].attribute,
                          value: attributeList[0].value,
                          unit: attributeList[0].unit,
                          maxValue: attributeList[0].maxValue,
                          mintValue: attributeList[0].minValue,
                        ),
                        VerticalSpacing(
                          of: 10,
                        ),
                        AttributeCard(
                          attribute: "Auto",
                          value: isAuto ? "On" : "Off",
                          unit: "",
                        ),
                        VerticalSpacing(
                          of: 10,
                        ),
                      ],
                    ));
              }
          }
        });
  }
}

Future<bool> getAutoByDeviceKey(String receiveDeviceKey) async {
  SharedPreferences prefsTemp = await prefs;
  if (receiveDeviceKey == 'bk-iot-light') {
    return true;
    return prefsTemp.getBool("lightAuto");
  } else if (receiveDeviceKey == 'bk-iot-temp') {
    return prefsTemp.getBool("heatAuto");
  } else {
    return prefsTemp.getBool("pummerAuto");
  }
}
