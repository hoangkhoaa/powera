import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/model/screen_model.dart';
import 'package:powera/size_config.dart';
import 'package:powera/ui/screens/login/components/wave_widget.dart';
import 'device_card.dart';
import 'package:powera/model/Device.dart';

class HomeHeader extends StatelessWidget {
  final SenderDevice sender_device;

  const HomeHeader({
    Key key,
    this.sender_device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(25)),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Image.asset(
          //   "assets/images/pbackground2.png",
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: getProportionateScreenHeight(370),
          // ),
          // Container(
          //   width: double.infinity,
          //   height: getProportionateScreenHeight(370),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         height: getProportionateScreenHeight(90),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(width: getProportionateScreenWidth(30)),
          //           Text(
          //             "Welcome",
          //             style: TextStyle(
          //                 fontSize: getProportionateScreenWidth(30),
          //                 fontWeight: FontWeight.normal,
          //                 color: pTextColorGray2,
          //                 height: 1),
          //           ),
          //         ],
          //       ),
          //       SizedBox(
          //         height: getProportionateScreenWidth(30),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(width: getProportionateScreenWidth(30)),
          //           Text(
          //             "User",
          //             style: TextStyle(
          //                 fontSize: getProportionateScreenWidth(50),
          //                 fontWeight: FontWeight.bold,
          //                 color: pTextColorGray2,
          //                 height: 0.5),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),

          Container(
            height: getProportionateScreenHeight(370),
            width: double.infinity,
            decoration: new BoxDecoration(
              color: pBackGroundColor,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(MediaQuery.of(context).size.width,
                      getProportionateScreenWidth(250))),
            ),
          ),
          Positioned(
              bottom: getProportionateScreenHeight(145),
              child: Container(
                color: Colors.white,
                width: 999,
                height: 999,
              )),
          Positioned(
            bottom: getProportionateScreenHeight(140),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeOutQuad,
              child: WaveWidget(
                size: Size(size.width, getProportionateScreenHeight(350)),
                yOffset: size.height / 3.1,
                color: pBackGourndColor1,
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(140),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              child: WaveWidget(
                size: Size(size.width, getProportionateScreenHeight(350)),
                yOffset: size.height / 3.0,
                color: pBackGroundColor,
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(250),
            child: Text(
              "Powera",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(50),
                  fontWeight: FontWeight.bold,
                  color: pItemColorChose,
                  height: 0.5),
            ),
          ),
          Positioned(
              bottom: getProportionateScreenHeight(20),
              child: DeviceCard(
                sender_device: sender_device,
              ))
        ],
      ),
    );
  }
}
