import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../chart_data.dart';

class DailyChart extends StatefulWidget {
  String deviceKey;
  DailyChart({Key key, this.deviceKey}) : super(key: key);
  @override
  _DailyChartState createState() => _DailyChartState(deviceKey);
}

class _DailyChartState extends State<DailyChart> {
  String deviceKey;
  _DailyChartState(this.deviceKey);
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    var data = getChartDataDay(deviceKey);
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color(0xff2c4260)),
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 10, bottom: 10, right: 10),
                child: FutureBuilder<dynamic>(
                    future: data,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        default:
                          if (snapshot.hasError) {
                            return Text('error: ${snapshot.error}');
                          } else
                            return LineChart(
                              showAvg
                                  ? avgData(snapshot.data)
                                  : mainData(snapshot.data),
                            );
                      }
                    })),
          ),
        ),
        SizedBox(
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 14,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(var data) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '00:00';
              case 8:
                return '8:00';
              case 16:
                return '16:00';
              case 23:
                return '23:00';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 30:
                return '30 mins';
              case 60:
                return '60 mins';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 25,
      minY: 0,
      maxY: 70,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, double.parse(data['1'])),
            FlSpot(1, double.parse(data['2'])),
            FlSpot(2, double.parse(data['3'])),
            FlSpot(3, double.parse(data['4'])),
            FlSpot(4, double.parse(data['5'])),
            FlSpot(5, double.parse(data['6'])),
            FlSpot(6, double.parse(data['7'])),
            FlSpot(7, double.parse(data['8'])),
            FlSpot(8, double.parse(data['9'])),
            FlSpot(9, double.parse(data['10'])),
            FlSpot(10, double.parse(data['11'])),
            FlSpot(11, double.parse(data['12'])),
            FlSpot(12, double.parse(data['13'])),
            FlSpot(13, double.parse(data['14'])),
            FlSpot(14, double.parse(data['15'])),
            FlSpot(15, double.parse(data['16'])),
            FlSpot(16, double.parse(data['17'])),
            FlSpot(17, double.parse(data['18'])),
            FlSpot(18, double.parse(data['19'])),
            FlSpot(19, double.parse(data['20'])),
            FlSpot(20, double.parse(data['21'])),
            FlSpot(21, double.parse(data['22'])),
            FlSpot(22, double.parse(data['23'])),
            FlSpot(23, double.parse(data['24'])),
          ],
          isCurved: false,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData(var data) {
    double result = 0;
    for (var i = 1; i <= 24; i++) {
      result += double.parse(data['$i']);
    }
    result = result / 24;
    return LineChartData(
      lineTouchData: LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '00:00';
              case 8:
                return '8:00';
              case 16:
                return '16:00';
              case 23:
                return '23:00';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 30:
                return '30';
              case 60:
                return '60';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0.5)),
      minX: 0,
      maxX: 25,
      minY: 0,
      maxY: 70,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, result),
            FlSpot(1, result),
            FlSpot(2, result),
            FlSpot(3, result),
            FlSpot(4, result),
            FlSpot(5, result),
            FlSpot(6, result),
            FlSpot(7, result),
            FlSpot(8, result),
            FlSpot(9, result),
            FlSpot(10, result),
            FlSpot(11, result),
            FlSpot(12, result),
            FlSpot(13, result),
            FlSpot(14, result),
            FlSpot(15, result),
            FlSpot(16, result),
            FlSpot(17, result),
            FlSpot(18, result),
            FlSpot(19, result),
            FlSpot(20, result),
            FlSpot(21, result),
            FlSpot(22, result),
            FlSpot(23, result),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
