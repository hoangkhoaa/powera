import 'package:flutter/material.dart';
import 'package:powera/constants.dart';
import 'package:powera/size_config.dart';
import 'package:powera/ui/components/chart.dart';
import 'package:powera/ui/components/daily_chart.dart';
import 'package:powera/ui/components/weekly_chart.dart';

class SelectChart extends StatefulWidget {
  String deviceKey;
  SelectChart({Key key, this.deviceKey}) : super(key: key);
  @override
  _SelectChartState createState() => _SelectChartState(deviceKey);
}

class _SelectChartState extends State<SelectChart> {
  String deviceKey;
  _SelectChartState(this.deviceKey);
  bool seletedDateChart = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: getProportionateScreenWidth(335),
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
                          color:
                              seletedDateChart ? pItemColorChose : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: pItemColorChose, width: 1)),
                      child: Center(
                        child: Text(
                          "Daily chart",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.bold,
                              color: seletedDateChart
                                  ? Colors.white
                                  : pTextColorGray2,
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
                          color:
                              seletedDateChart ? Colors.white : pItemColorChose,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: pItemColorChose, width: 1)),
                      child: Center(
                        child: Text(
                          "Weekly chart",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.bold,
                              color: seletedDateChart
                                  ? pTextColorGray2
                                  : Colors.white,
                              height: 0.5),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              VerticalSpacing(
                of: 10,
              ),
              seletedDateChart
                  ? DailyChart(
                      key: UniqueKey(),
                      deviceKey: deviceKey,
                    )
                  : WeeklyChart(
                      key: UniqueKey(),
                      deviceKey: deviceKey,
                    )
            ],
          ),
        ),
        IconButton(
          onPressed: () async {
            return showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return ChartDisDialog();
              },
            );
          },
          icon: Icon(
            Icons.quiz,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class ChartDisDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        'Chart Discripton',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: pTextColorGray2,
            height: 0.5),
      )),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
              'Daily Chart shows information about the number of minuses that device turned on per hour in this day.The left axis displays minus and bottom axis displays hour of day.',
            ),
            Text(
                'Daily Chart has average button which display the average minus per hour in that day.'),
            Text(''),
            Text(
                'Weekly Chart shows information about the avarage minus/hour in this week. The left axis displays minus and bottom axis displays day of week.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Okay, I got it'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
