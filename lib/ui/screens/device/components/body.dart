import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/model/Device.dart';
import 'package:powera/model/example_db.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/ui/screens/device/components/head_body.dart';
import 'package:powera/size_config.dart';
import 'package:powera/ui/screens/device/components/select_chart.dart';
import 'package:powera/ui/screens/device/device_screen.dart';
import 'package:powera/ui/screens/settings/setting_screen.dart';
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
              return SafeArea(
                  top: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeHeader(
                        // itemData: getScreenModleFollowState(state)
                        sender_device: sender_device,
                      ),
                      ListAttributeCard(
                        sender_device: sender_device,
                        receiver_device: receiver_device,
                      ),
                      SelectChart()
                    ],
                  ));
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
      AttributeModel(
          attribute: 'Auto', value: sender_device.auto == true ? 'On' : 'Off')
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: getProportionateScreenWidth(320),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: attributeList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AttributeCard(
                      attribute: attributeList[index].attribute,
                      value: attributeList[index].value,
                      unit: attributeList[index].unit,
                      maxValue: attributeList[index].maxValue,
                      mintValue: attributeList[index].minValue,
                    ),
                    VerticalSpacing(
                      of: 10,
                    ),
                  ],
                );
              }),
        ));
  }
}
