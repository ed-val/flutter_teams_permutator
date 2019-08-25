import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatefulWidget {
  final int winPercentage;
  final int losePercentage;
  final int drawPercentage;
  final String team;
  final double chartHeight;
  RadialChart({
    Key key,
    this.chartHeight,
    this.winPercentage,
    this.drawPercentage,
    this.losePercentage,
    this.team,
  });
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
      height: 200,
      child: SfCircularChart(
        margin: EdgeInsets.all(5),
        legend: Legend(
          padding: 0.0,
          isVisible: true,
          iconHeight: 20,
          iconWidth: 20,
          width: '100%',
          alignment: ChartAlignment.near,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        tooltipBehavior: TooltipBehavior(
          color: CupertinoTheme.of(context).primaryColor,
          enable: true,
          format: 'point.x',
          animationDuration: 1000,
          activationMode: ActivationMode.singleTap,
        ),
        series: getRadialBarSeries(
          widget.winPercentage,
          widget.losePercentage,
          widget.drawPercentage,
          widget.team,
        ),
      ),
    );
  }
}

// Color getColorForRadial(int percentage) {
//   if (percentage >= 0 && percentage <= 32) {
//     return Colors.red[300];
//   } else if (percentage >= 33 && percentage <= 65) {
//     return Colors.yellow[300];
//   } else if (percentage >= 66) {
//     return Colors.green[300];
//   }
//   return Colors.black;
// }

Map<String, Color> _radialTrackColor(int percentage) {
  if (percentage <= 10) {
    return {'color': Colors.red[900], 'text': Colors.white};
  } else if (percentage > 10 && percentage <= 20) {
    return {'color': Colors.red, 'text': Colors.white};
  } else if (percentage > 20 && percentage <= 30) {
    return {'color': Colors.orange[900], 'text': Colors.white};
  } else if (percentage > 30 && percentage <= 40) {
    return {'color': Colors.orange, 'text': Colors.black};
  } else if (percentage > 40 && percentage <= 50) {
    return {'color': Colors.yellow[800], 'text': Colors.black};
  } else if (percentage > 50 && percentage <= 60) {
    return {'color': Colors.yellow[400], 'text': Colors.black};
  } else if (percentage > 60 && percentage <= 70) {
    return {'color': Colors.green, 'text': Colors.white};
  } else if (percentage > 70 && percentage <= 80) {
    return {'color': Colors.green[700], 'text': Colors.white};
  } else if (percentage > 80 && percentage <= 90) {
    return {'color': Colors.lightGreen[900], 'text': Colors.white};
  } else if (percentage > 90 && percentage <= 100) {
    return {'color': Colors.indigo, 'text': Colors.white};
  } else
    return {'color': Colors.white, 'text': Colors.black};
}

List<RadialBarSeries<_RadialData, String>> getRadialBarSeries(
  int winPercentage,
  int losePercentage,
  int drawPercentage,
  String team,
) {
  final List<_RadialData> chartData = <_RadialData>[
    _RadialData(
      'DRAW $drawPercentage%\n$team \ndraw the match.',
      drawPercentage,
      'Draw  ',
      null,
      _radialTrackColor(drawPercentage)['color'],
    ),
    _RadialData(
      'LOSE $losePercentage%\n$team \nloses match.',
      losePercentage,
      'Lose  ',
      null,
      _radialTrackColor(losePercentage)['color'],
    ),
    _RadialData(
      'WIN $winPercentage%\n$team \nwins match.',
      winPercentage,
      'Win  ',
      null,
      _radialTrackColor(winPercentage)['color'],
    ),
  ];
  var list = <RadialBarSeries<_RadialData, String>>[
    RadialBarSeries<_RadialData, String>(
      animationDuration: 1300,
      pointRadiusMapper: (_RadialData data, _) => data.radius,
      maximumValue: 100,
      radius: '100%',
      gap: '12%',
      enableSmartLabels: true,
      innerRadius: '40%',
      dataSource: chartData,
      cornerStyle: CornerStyle.bothCurve,
      xValueMapper: (_RadialData data, _) => data.xVal,
      yValueMapper: (_RadialData data, _) => data.yVal,
      pointColorMapper: (_RadialData data, _) => data.color,
      dataLabelMapper: (_RadialData data, _) => data.text,
      dataLabelSettings: DataLabelSettings(isVisible: true),
    )
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
