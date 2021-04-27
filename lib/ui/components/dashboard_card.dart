import 'package:flutter/material.dart';
import 'package:powera/size_config.dart';
import 'package:powera/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardCard extends StatelessWidget {
  final bool isActive;
  final String name;
  final Image image;
  DashboardCard(
      {Key key, this.isActive = false, this.name = "null", this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(100),
      child: Center(
          child: isActive
              ? OnlineCard(
                  name: name,
                  image: image,
                )
              : OfflineCard(
                  name: name,
                  image: image,
                )),
    );
  }
}

class OfflineCard extends StatelessWidget {
  final Image image;
  final String name;
  OfflineCard({Key key, this.image, this.name = "none"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: pItemOffColor, width: 2.5)),
      child: SizedBox(
          width: getProportionateScreenWidth(250),
          height: getProportionateScreenHeight(80),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: image,
                ),
                Flexible(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("$name",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(17),
                                  fontWeight: FontWeight.bold,
                                  color: pItemOffColor,
                                  height: 1)),
                        ),
                        Center(
                          child: Text("Status:  Off",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(17),
                                  fontWeight: FontWeight.normal,
                                  color: pTextColorGray3,
                                  height: 1)),
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}

class OnlineCard extends StatefulWidget {
  final Image image;
  final String name;
  OnlineCard({Key key, this.image, this.name = "none"}) : super(key: key);
  @override
  _OnlineCardState createState() => _OnlineCardState(image: image, name: name);
}

class _OnlineCardState extends State<OnlineCard> with TickerProviderStateMixin {
  final Image image;
  final String name;
  _OnlineCardState({this.image, this.name = "none"});

  AnimationController _resizableController;

  AnimatedBuilder getContainer() {
    print(_resizableController.value);
    return new AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            child: SizedBox(
                width: getProportionateScreenWidth(250),
                height: getProportionateScreenHeight(80),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: this.image,
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("$name",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(17),
                                        fontWeight: FontWeight.bold,
                                        color: pItemOnColor,
                                        height: 1)),
                              ),
                              Center(
                                child: Text("Status:  On",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(17),
                                        fontWeight: FontWeight.normal,
                                        color: pTextColorGray3,
                                        height: 1)),
                              )
                            ],
                          )),
                    ],
                  ),
                )),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: pItemOnColor,
                    width: 2.5 + _resizableController.value * 2),
                boxShadow: [
                  BoxShadow(
                      offset: Offset.fromDirection(20),
                      color: Colors.lightGreen,
                      blurRadius: 15,
                      spreadRadius: _resizableController.value * 2)
                ]),
          );
        });
  }

  @override
  void initState() {
    _resizableController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 1000,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }

  @override
  dispose() {
    _resizableController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getContainer();
  }
}

/// This class will use for animation template
// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> with TickerProviderStateMixin {
//   AnimationController _resizableController;

//   AnimatedBuilder getContainer() {
//     return new AnimatedBuilder(
//         animation: _resizableController,
//         builder: (context, child) {
//           return Container(
//             padding: EdgeInsets.all(24),
//             child: Text("SAMPLE"),
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//               border: Border.all(
//                   color: Colors.blue, width: _resizableController.value * 10),
//             ),
//           );
//         });
//   }

//   @override
//   void initState() {
//     _resizableController = new AnimationController(
//       vsync: this,
//       duration: new Duration(
//         milliseconds: 1000,
//       ),
//     );
//     _resizableController.addStatusListener((animationStatus) {
//       switch (animationStatus) {
//         case AnimationStatus.completed:
//           _resizableController.reverse();
//           break;
//         case AnimationStatus.dismissed:
//           _resizableController.forward();
//           break;
//         case AnimationStatus.forward:
//           break;
//         case AnimationStatus.reverse:
//           break;
//       }
//     });
//     _resizableController.forward();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return getContainer();
//   }
// }
