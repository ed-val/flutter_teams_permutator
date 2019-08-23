import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatefulWidget {
  @override
  _RadialChartState createState() => _RadialChartState();
}

class _RadialChartState extends State<RadialChart> {
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getAngleRadialBarChart(),
    );
  }
}

SfCircularChart getAngleRadialBarChart() {
  return SfCircularChart(
    // title: ChartTitle(text: isTileView ? '' : 'Activity tracker'),
    legend: Legend(
      isVisible: true,
      iconHeight: 20,
      iconWidth: 20,
      overflowMode: LegendItemOverflowMode.wrap,
    ),
    tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x'),
    series: getRadialBarSeries(),
  );
}

Color getColorForRadial(int percentage) {
  if (percentage >= 0 && percentage <= 32) {
    return Colors.red[300];
  } else if (percentage >= 33 && percentage <= 65) {
    return Colors.yellow[300];
  } else if (percentage >= 66) {
    return Colors.green[300];
  }
  return Colors.black;
}

List<RadialBarSeries<_RadialData, String>> getRadialBarSeries(
  int winPercentage,
  int losePercentage,
  int drawPercentage,
  String team,
) {
  final List<_RadialData> chartData = <_RadialData>[
    _RadialData('Move $winPercentage%\n$team wins match.', winPercentage,
        'Win  ', null, getColorForRadial(winPercentage)),
    _RadialData('Exercise $losePercentage%\n$team loses match.', losePercentage,
        'Lose  ', null, getColorForRadial(losePercentage)),
    _RadialData('Stand $drawPercentage%\n$team draw the match.', drawPercentage,
        'Draw  ', null, getColorForRadial(drawPercentage)),
  ];
  var list = <RadialBarSeries<_RadialData, String>>[
    RadialBarSeries<_RadialData, String>(
        animationDuration: 1300,
        pointRadiusMapper: (_RadialData data, _) => data.radius,
        maximumValue: 100,
        radius: '100%',
        gap: '12%',
        innerRadius: '30%',
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        xValueMapper: (_RadialData data, _) => data.xVal,
        yValueMapper: (_RadialData data, _) => data.yVal,
        pointColorMapper: (_RadialData data, _) => data.color,
        dataLabelMapper: (_RadialData data, _) => data.text,
        dataLabelSettings: DataLabelSettings(isVisible: true))
  ];
  return list;
}

class _RadialData {
  _RadialData(this.xVal, this.yVal, [this.text, this.radius, this.color]);
  final String xVal;
  final int yVal;
  final String text;
  final String radius;
  final Color color;
}
