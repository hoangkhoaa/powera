import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powera/bloc/navigation_bloc.dart';
import 'package:powera/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
////// Bottom nav bar ver 2.0

class AnimatedBottomBar extends StatefulWidget {
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNav(
      currentIndex: _currentPage,
      onChange: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }
}

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  const AnimatedBottomNav({Key key, this.currentIndex, this.onChange})
      : super(key: key);
  void handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavBloc>(context).add(NavigateTo(item));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                onChange(0);
                handleItemClick(context, NavItem.light_page);
              },
              child: BottomNavItem(
                icon: "assets/icons/ic_light.svg",
                title: "Light",
                isActive: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onChange(1);
                handleItemClick(context, NavItem.heat_page);
              },
              child: BottomNavItem(
                icon: "assets/icons/ic_heat.svg",
                title: "Heat",
                isActive: currentIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onChange(2);
                handleItemClick(context, NavItem.humid_page);
              },
              child: BottomNavItem(
                icon: "assets/icons/ic_temp.svg",
                title: "Moisture",
                isActive: currentIndex == 2,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onChange(3);
                handleItemClick(context, NavItem.setting_page);
              },
              child: BottomNavItem(
                icon: "assets/icons/ic_settings.svg",
                title: "Settings",
                isActive: currentIndex == 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final String icon;
  final String title;
  const BottomNavItem({Key key, this.isActive = false, this.icon, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive
          ? Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: pItemColorChose,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pItemColorChose,
                    ),
                  ),
                ],
              ),
            )
          : SvgPicture.asset(
              icon,
              color: pItemColor,
              height: 30,
            ),
    );
  }
}
