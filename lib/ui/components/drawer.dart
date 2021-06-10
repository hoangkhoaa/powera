import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/bloc/navigation_bloc.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/size_config.dart';
import 'package:powera/constants.dart';
import 'package:powera/ui/components/dasbboard_card_info.dart';
import 'package:powera/ui/components/dashboard_card.dart';
import 'package:powera/ui/screens/device/device_screen.dart';

class CustomDashboard extends StatelessWidget {
  CustomDashboard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    ExactAssetImage('assets/images/dashboard_background.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(30),
                  0, getProportionateScreenHeight(10)),
              child: Image.asset(
                "assets/images/logo_bk.png",
                height: getProportionateScreenHeight(100),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "System info",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(25),
                    fontWeight: FontWeight.bold,
                    color: pTextColorGray2,
                    height: 0.5),
              ),
            ),
            BlocBuilder<NavBloc, NavState>(builder: (context, state) {
              return DashBoardCardList(
                  listItem: getListScreenModelFollowState(state));
            })
          ],
        ));
  }
}

class DashBoardCardList extends StatelessWidget {
  final List<ScreenModel> listItem;
  DashBoardCardList({this.listItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(500),
      width: getProportionateScreenWidth(200),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashboardCardInfor(
              name: listItem[0].deviceName,
              img: listItem[0].image,
              disc: listItem[0].deviceDis,
            ),
            VerticalSpacing(
              of: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_downward_rounded,
                    color: pItemOnColor,
                    size: getProportionateScreenHeight(50),
                  ),
                  Icon(
                    Icons.arrow_upward_rounded,
                    color: pItemOnColor,
                    size: getProportionateScreenHeight(50),
                  ),
                ],
              ),
            ),
            VerticalSpacing(
              of: 10,
            ),
            DashboardCardInfor(
              name: listItem[1].deviceName,
              img: listItem[1].image,
              disc: listItem[1].deviceDis,
            ),
          ],
        ),
        // child: ListView.builder(
        //     physics: NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     scrollDirection: Axis.vertical,
        //     itemCount: listItem.length,
        //     itemBuilder: (context, index) {
        //       return DashboardCard(
        //           isActive: listItem[index].isOn,
        //           name: listItem[index].deviceName,
        //           image: Image.asset(listItem[index].image),
        //           tapFunction: () {
        //             BlocProvider.of<NavBloc>(context).add(
        //                 NavigateTo(getNavItemBaseOnItemData(listItem[index])));
        //           });
        //     }),
      ),
    );
  }
}
