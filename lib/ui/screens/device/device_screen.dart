import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/bloc/navigation_bloc.dart';
import 'package:powera/model/Device.dart';
import 'package:powera/model/example_db.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/ui/components/app_bar.dart';
import 'package:powera/ui/screens/device/components/body.dart';
import 'package:powera/ui/components/bottom_nav_bar.dart';
import 'package:powera/bloc/power_button_bloc.dart';
import 'package:powera/ui/screens/device/components/graph.dart';
import 'package:powera/ui/components/drawer.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavBloc>(
      create: (context) => NavBloc(NavState(NavItem.light_page)),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocProvider<PowerButtonBloc_Shape>(
            create: (context) => PowerButtonBloc_Shape(SomeGraph(
              color: Colors.amber,
              borderRadius: BorderRadius.zero,
            )),
            // child: SingleChildScrollView(
            //   child: Body(),
            // ),
            child: Body(),
          ),
          bottomNavigationBar: AnimatedBottomBar(),
          drawer: Drawer(
            child: CustomDashboard(
              key: UniqueKey(),
            ),
          ),
          appBar: buildAppBar(context)),
    );
  }
}

Future<List<Device>> getDevices(NavState state) async {
  var lstDevice = deviceKeyMapByNavState[state.selectedItem];
  SenderDevice sender_device = SenderDevice(lstDevice["SenderDevice"]);
  ReceiverDevice receiver_device = ReceiverDevice(lstDevice["ReceiverDevice"]);
  await sender_device.getDevice();
  await receiver_device.getDevice();
  return [sender_device, receiver_device];
}

ScreenModel getScreenModleFollowState(NavState state) {
  switch (state.selectedItem) {
    case NavItem.heat_page:
      {
        return dataDB['heat'][0];
      }
      break;
    case NavItem.light_page:
      {
        return dataDB['light'][0];
      }
      break;
    case NavItem.humid_page:
      {
        return dataDB['humid'][0];
      }
      break;
    case NavItem.setting_page:
      {
        return dataDB['humid'][0];
      }
      break;
    case NavItem.heat_page1:
      {
        return dataDB['heat'][1];
      }
      break;
    case NavItem.light_page1:
      {
        return dataDB['light'][1];
      }
      break;
    case NavItem.humid_page1:
      {
        return dataDB['humid'][1];
      }
      break;
    default:
      {
        return dataDB['humid'][0];
      }
      break;
  }
}

List<ScreenModel> getListScreenModelFollowState(NavState state) {
  switch (state.selectedItem) {
    case NavItem.heat_page:
      {
        return dataDB['heat'];
      }
      break;
    case NavItem.light_page:
      {
        return dataDB['light'];
      }
      break;
    case NavItem.humid_page:
      {
        return dataDB['humid'];
      }
      break;
    case NavItem.setting_page:
      {
        return dataDB['humid'];
      }
      break;
    case NavItem.heat_page1:
      {
        return dataDB['heat'];
      }
      break;
    case NavItem.light_page1:
      {
        return dataDB['light'];
      }
      break;
    case NavItem.humid_page1:
      {
        return dataDB['humid'];
      }
      break;
  }
  return [];
}

NavItem getNavItemBaseOnItemData(ScreenModel itemdata) {
  switch (itemdata.deviceName) {
    case "Speaker buzzer":
      {
        return NavItem.heat_page;
      }
      break;
    case "Temperature sensor":
      {
        return NavItem.heat_page1;
      }
      break;
    case "LED light":
      {
        return NavItem.light_page;
      }
      break;
    case "Light sensor":
      {
        return NavItem.light_page1;
      }
      break;
    case "Water pump":
      {
        return NavItem.humid_page;
      }
      break;
    case "Humidity sensor":
      {
        return NavItem.humid_page1;
      }
      break;
  }
}
