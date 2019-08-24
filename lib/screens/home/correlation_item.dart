import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/widgets/cupertino_container.dart';
import 'package:teams_permutator/widgets/radial_chart.dart';

class CorrelationItem extends StatefulWidget {
  final int homeScore;
  final int awayScore;
  final String teamHome;
  final String teamAway;
  final int dominion;
  final int correlationScore;
  final String tier;
  CorrelationItem({
    Key key,
    this.tier,
    this.correlationScore,
    this.awayScore,
    this.dominion,
    this.homeScore,
    this.teamAway,
    this.teamHome,
  }) : super(key: key);

  _CorrelationItemState createState() => _CorrelationItemState();
}

class _CorrelationItemState extends State<CorrelationItem> {
  Color _multipliersScoreColor(int score) {
    if (score < 0) {
      return CupertinoColors.destructiveRed;
    } else if (score == 0) {
      return CupertinoColors.black;
    } else if (score > 0) {
      return CupertinoColors.activeGreen;
    }
    return Colors.black;
  }

  Color _tierColor(int correlationScore) {
    if (correlationScore <= 10) {
      return Colors.red[900];
    } else if (correlationScore > 10 && correlationScore <= 20) {
      return Colors.red;
    } else if (correlationScore > 20 && correlationScore <= 30) {
      return Colors.orange[900];
    } else if (correlationScore > 30 && correlationScore <= 40) {
      return Colors.orange;
    } else if (correlationScore > 40 && correlationScore <= 50) {
      return Colors.yellow[800];
    } else if (correlationScore > 50 && correlationScore <= 60) {
      return Colors.yellow[400];
    } else if (correlationScore > 60 && correlationScore <= 70) {
      return Colors.green;
    } else if (correlationScore > 70 && correlationScore <= 80) {
      return Colors.lightGreen[800];
    } else if (correlationScore > 80 && correlationScore <= 90) {
      return Colors.blue[900];
    } else if (correlationScore > 90 && correlationScore <= 100) {
      return Colors.black;
    }
  }

  String _scoreSign(int score) {
    if (score > 0) {
      return '+';
    } else {
      return '';
    }
  }

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
                  Text('${widget.teamHome} vs. ${widget.teamAway}'),
                  const Divider(
                    height: 2.0,
                    endIndent: 20,
                    indent: 20,
                    color: CupertinoColors.inactiveGray,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Correlation as visitant:',
                        maxLines: 1,
                        softWrap: false,
                      ),
                      Text(
                        '${_scoreSign(widget.awayScore)}${widget.awayScore}',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle
                            .copyWith(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: _multipliersScoreColor(widget.awayScore),
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Correlation at home:',
                        maxLines: 1,
                        softWrap: false,
                      ),
                      Text(
                        '${_scoreSign(widget.homeScore)}${widget.homeScore}',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle
                            .copyWith(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: _multipliersScoreColor(widget.homeScore),
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Dominion over oponent:',
                        maxLines: 1,
                        softWrap: false,
                      ),
                      Text(
                        '${_scoreSign(widget.dominion)}${widget.dominion}',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle
                            .copyWith(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: _multipliersScoreColor(widget.dominion),
                            ),
                      ),
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Correlation Score:'),
                      Container(
                        // margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 12,
                          ),
                          child: Text('${widget.correlationScore}'),
                        ),
                        // width: MediaQuery.of(context).size.width * 0.15,
                        decoration: ShapeDecoration(
                          // color for correlationScore
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: MediaQuery.of(context).size.width * 0.006,
                              // color for correlation tier
                              color: CupertinoTheme.of(context).primaryColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   child: Text('${widget.correlationScore}'),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
