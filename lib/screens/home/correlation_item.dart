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
                children: <Widget>[
                  Text('(LOGO) FBC vs. REAL MADRID (LOGO)'),
                  Text('Score as visitant: 14'),
                  Text('Score at home: 19'),
                  Text('Dominion over oponent: +3'),
                  Text(
                    'Disputes with this outcome: 5 out of 7 (71.4%)',
                  ),
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
