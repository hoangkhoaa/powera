import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:powera/chart_data.dart';

class WeeklyChart extends StatefulWidget {
  String deviceKey;
  WeeklyChart({Key key, this.deviceKey}) : super(key: key);
  @override
  State<StatefulWidget> createState() => WeeklyChartState(deviceKey);
}

class WeeklyChartState extends State<WeeklyChart> {
  String deviceKey;
  WeeklyChartState(this.deviceKey);
  @override
  Widget build(BuildContext context) {
    var data = getChartDataWeek(deviceKey);
    return FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('error: ${snapshot.error}');
              } else
                return AspectRatio(
                  aspectRatio: 1.7,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xff2c4260),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 70,
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipMargin: 8,
                            getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                            ) {
                              return BarTooltipItem(
                                rod.y.round().toString(),
                                TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                                color: Color(0xff7589a2),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            margin: 20,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'Mn';
                                case 1:
                                  return 'Te';
                                case 2:
                                  return 'Wd';
                                case 3:
                                  return 'Tu';
                                case 4:
                                  return 'Fr';
                                case 5:
                                  return 'St';
                                case 6:
                                  return 'Sn';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                  y: double.parse(snapshot.data['2']) == 0
                                      ? 0.1
                                      : double.parse(snapshot.data['2']),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                  y: double.parse(snapshot.data['3']) == 0
                                      ? 0.1
                                      : double.parse(snapshot.data['3']),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                  y: double.parse(snapshot.data['4']) == 0
                                      ? 0.1
                                      : double.parse(snapshot.data['4']),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: double.parse(snapshot.data['5']) == 0
                                      ? 0.1
                                      : double.parse(snapshot.data['5']),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                  y: double.parse(snapshot.data['6']) == 0
                                      ? 0.1
                                      : double.parse(snapshot.data['6']),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                  y: double.parse(snapshot.data['7']) == 0
                                      ? 0.1
                                      : double.parse(snapshot.data['7']),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                  y: double.parse(snapshot.data['7']) == 0
                                      ? 0.1
                                      : double.parse(snapshot.data['7']),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          )
                        ],
                      ),
                    ),
                  ),
                );
          }
        });
  }
}
