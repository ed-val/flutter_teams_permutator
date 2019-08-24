import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/widgets/cupertino_container.dart';
import 'package:teams_permutator/widgets/radial_chart.dart';

class CorrelationItem extends StatefulWidget {
  CorrelationItem({Key key}) : super(key: key);

  _CorrelationItemState createState() => _CorrelationItemState();
}

class _CorrelationItemState extends State<CorrelationItem> {
  @override
  Widget build(BuildContext context) {
    return CupertinoContainer(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: RadialChart(
              drawPercentage: 5,
              losePercentage: 43,
              winPercentage: 84,
              team: 'Bayern München FB',
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Match:',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(fontSize: 20, letterSpacing: 1),
                  ),
                  Text('FBC vs. REAL MADRID'),
                  Text('Performance as visitant: 14'),
                  Text('Score at home: 19'),
                  Text('Dominion over oponent: +3'),
                  Text('Disputes with this outcome: 5 out of 7 (71.4%)'),
                  Text('CORRELATION OVERALL SCORE: ( 95 )'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
