import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:powera/size_config.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                isActive: true,
                icon: "assets/icons/ic_heat.svg",
                title: "Heat",
                press: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => EventsScreen(),
                  //     ));
                },
              ),
              NavItem(
                icon: "assets/icons/ic_light.svg",
                title: "Light",
                press: () {},
              ),
              NavItem(
                icon: "assets/icons/ic_temp.svg",
                title: "Humidity",
                press: () {},
              ),
              NavItem(
                icon: "assets/icons/ic_settings.svg",
                title: "settings",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.press,
    this.isActive = false,
  }) : super(key: key);
  final String icon, title;
  final GestureTapCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5),
        height: getProportionateScreenWidth(60),
        width: getProportionateScreenWidth(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              color: isActive ? pItemColorChose : pItemColor,
              height: 30,
            ),
            Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
