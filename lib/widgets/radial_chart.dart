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
    return Center(
      child: getAngleRadialBarChart(true),
    );
  }
}

SfCircularChart getAngleRadialBarChart(bool isTileView) {
  return SfCircularChart(
    title: ChartTitle(text: isTileView ? '' : 'Activity tracker'),
    legend: Legend(
      isVisible: true,
      iconHeight: 20,
      iconWidth: 20,
      overflowMode: LegendItemOverflowMode.wrap,
    ),
    tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x'),
    series: getRadialBarSeries(isTileView),
  );
}

List<RadialBarSeries<_RadialData, String>> getRadialBarSeries(bool isTileView) {
  final List<_RadialData> chartData = <_RadialData>[
    _RadialData('Move 65%\n338/520 CAL', 65, 'Move  ', null,
        Color.fromRGBO(0, 201, 230, 1.0)),
    _RadialData('Exercise 43%\n13/30 MIN', 43, 'Exercise  ', null,
        Color.fromRGBO(63, 224, 0, 1.0)),
    _RadialData('Stand 58%\n7/12 HR', 58, 'Stand  ', null,
        Color.fromRGBO(226, 1, 26, 1.0)),
  ];
  var list = <RadialBarSeries<_RadialData, String>>[
    RadialBarSeries<_RadialData, String>(
        animationDuration: 1200,
        pointRadiusMapper: (_RadialData data, _) => data.radius,
        maximumValue: 100,
        radius: '100%',
        gap: '15%',
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
