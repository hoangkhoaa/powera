import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:powera/ui/components/chart.dart';
import 'package:powera/ui/components/daily_chart.dart';
import 'package:powera/ui/components/weekly_chart.dart';

class SelectChart extends StatefulWidget {
  SelectChart({Key key}) : super(key: key);
  @override
  _SelectChartState createState() => _SelectChartState();
}

class _SelectChartState extends State<SelectChart> {
  bool seletedDateChart = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(330),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    seletedDateChart = true;
                  });
                },
                child: Container(
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                      color: seletedDateChart ? pItemColorChose : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: pItemColorChose, width: 1)),
                  child: Center(
                    child: Text(
                      "Daily chart",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.bold,
                          color:
                              seletedDateChart ? Colors.white : pTextColorGray2,
                          height: 0.5),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    seletedDateChart = false;
                  });
                },
                child: Container(
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                      color: seletedDateChart ? Colors.white : pItemColorChose,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: pItemColorChose, width: 1)),
                  child: Center(
                    child: Text(
                      "Weekly chart",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.bold,
                          color:
                              seletedDateChart ? pTextColorGray2 : Colors.white,
                          height: 0.5),
                    ),
                  ),
                ),
              )
            ],
          ),
          VerticalSpacing(
            of: 5,
          ),
          seletedDateChart
              ? DailyChart(
                  key: UniqueKey(),
                )
              : WeeklyChart(key: UniqueKey())
        ],
      ),
    );
  }
}
