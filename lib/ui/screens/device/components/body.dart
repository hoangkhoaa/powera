import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/model/example_db.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/ui/screens/device/components/head_body.dart';
import 'package:powera/size_config.dart';
import 'attribute_card.dart';
import 'package:powera/bloc/power_button_bloc.dart';
import 'package:powera/bloc/navigation_bloc.dart';

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
  final ScreenModel screen;
  Body(this.screen);
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeHeader(
              itemData: screen,
            ),
            AttributeCard(
              attribute: "Temperature",
              value: 45,
              maxValue: 100,
              mintValue: 0,
            ),
            VerticalSpacing(of: 10),
            AttributeCard(
              attribute: "Auto",
              value: 99,
              maxValue: 100,
              mintValue: 0,
            ),
            Expanded(child: Center(
              child: BlocBuilder<PowerButtonBloc_Shape, SomeGraph>(
                builder: (context, shape) {
                  print("rebuild shape");
                  return shape;
                },
              ),
            ))
          ],
        ));
  }
}
