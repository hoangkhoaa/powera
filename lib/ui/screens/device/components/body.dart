import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/model/Device.dart';
import 'package:powera/model/example_db.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/ui/screens/device/components/head_body.dart';
import 'package:powera/size_config.dart';
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
            if (snapshot.data != null &&
                snapshot.data[0].deviceKey ==
                    deviceKeyMapByNavState[state.selectedItem]
                        ["SenderDevice"]) {
              print(state.selectedItem);
              print("Snapshot data: " + snapshot.data.toString());
              print("Current device: " + snapshot.data[0].deviceKey);
              List<Device> lstDevices = snapshot.data;
              Device sender_device = lstDevices[0];
              Device receiver_device = lstDevices[1];
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
                          attributeList:
                              getScreenModleFollowState(state).attributeList),
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
  final List<AttributeModel> attributeList;
  ListAttributeCard({this.attributeList});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(180),
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
                return AttributeCard(
                  attribute: attributeList[index].attribute,
                  value: attributeList[index].value,
                  maxValue: attributeList[index].value,
                  mintValue: attributeList[index].value,
                );
              }),
        ));
  }
}
