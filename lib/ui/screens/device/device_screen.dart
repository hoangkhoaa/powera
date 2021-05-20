import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/bloc/navigation_bloc.dart';
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
      create: (context) => NavBloc(NavState(NavItem.heat_page)),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocProvider<PowerButtonBloc_Shape>(
            create: (context) => PowerButtonBloc_Shape(SomeGraph(
              color: Colors.amber,
              borderRadius: BorderRadius.zero,
            )),
            child: Body(),
          ),
          bottomNavigationBar: AnimatedBottomBar(),
          drawer: Drawer(
            child: CustomDashboard(),
          ),
          appBar: buildAppBar(context)),
    );
  }
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
    default:
      {
        return dataDB['humid'][0];
      }
      break;
  }
}
