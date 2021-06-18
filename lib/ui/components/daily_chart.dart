import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

var rng = new Random();

class DailyChart extends StatefulWidget {
  DailyChart({Key key}) : super(key: key);
  @override
  _DailyChartState createState() => _DailyChartState();
}

class _DailyChartState extends State<DailyChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
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
              case 6:
                return '6:00';
              case 12:
                return '12:00';
              case 18:
                return '18:00';
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
              case 10:
                return '10';
              case 40:
                return '40';
              case 80:
                return '80';
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
      maxX: 24,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, rng.nextInt(100).toDouble() + 5),
            FlSpot(1, rng.nextInt(100).toDouble() + 5),
            FlSpot(2, rng.nextInt(100).toDouble() + 5),
            FlSpot(3, rng.nextInt(100).toDouble() + 5),
            FlSpot(4, rng.nextInt(100).toDouble() + 5),
            FlSpot(5, rng.nextInt(100).toDouble() + 5),
            FlSpot(6, rng.nextInt(100).toDouble() + 5),
            FlSpot(7, rng.nextInt(100).toDouble() + 5),
            FlSpot(8, rng.nextInt(100).toDouble() + 5),
            FlSpot(9, rng.nextInt(100).toDouble() + 5),
            FlSpot(10, rng.nextInt(100).toDouble() + 5),
            FlSpot(11, rng.nextInt(100).toDouble() + 5),
            FlSpot(12, rng.nextInt(100).toDouble() + 5),
            FlSpot(13, rng.nextInt(100).toDouble() + 5),
            FlSpot(14, rng.nextInt(100).toDouble() + 5),
            FlSpot(15, rng.nextInt(100).toDouble() + 5),
            FlSpot(16, rng.nextInt(100).toDouble() + 5),
            FlSpot(17, rng.nextInt(100).toDouble() + 5),
            FlSpot(18, rng.nextInt(100).toDouble() + 5),
            FlSpot(19, rng.nextInt(100).toDouble() + 5),
            FlSpot(20, rng.nextInt(100).toDouble() + 5),
            FlSpot(21, rng.nextInt(100).toDouble() + 5),
            FlSpot(22, rng.nextInt(100).toDouble() + 5),
            FlSpot(23, rng.nextInt(100).toDouble() + 5),
          ],
          isCurved: true,
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

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
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
              case 6:
                return '6:00';
              case 12:
                return '12:00';
              case 18:
                return '18:00';
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
              case 10:
                return '10';
              case 40:
                return '40';
              case 80:
                return '80';
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
      maxX: 24,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 50),
            FlSpot(1, 50),
            FlSpot(2, 50),
            FlSpot(3, 50),
            FlSpot(4, 50),
            FlSpot(5, 50),
            FlSpot(6, 50),
            FlSpot(7, 50),
            FlSpot(8, 50),
            FlSpot(9, 50),
            FlSpot(10, 50),
            FlSpot(11, 50),
            FlSpot(12, 50),
            FlSpot(13, 50),
            FlSpot(14, 50),
            FlSpot(15, 50),
            FlSpot(16, 50),
            FlSpot(17, 50),
            FlSpot(18, 50),
            FlSpot(19, 50),
            FlSpot(20, 50),
            FlSpot(21, 50),
            FlSpot(22, 50),
            FlSpot(23, 50),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
