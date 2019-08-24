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
  final String selectedTeam;
  CorrelationItem({
    Key key,
    this.tier,
    this.correlationScore,
    this.awayScore,
    this.dominion,
    this.homeScore,
    this.teamAway,
    this.teamHome,
    this.selectedTeam,
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

  Color _tierColor(String tier) {
    if (tier == 'bronze') {
      return Colors.brown[300];
    } else if (tier == 'silver') {
      return Colors.grey[350];
    } else if (tier == 'gold') {
      return Colors.amber[300];
    } else if (tier == 'platinum') {
      return Colors.blueGrey[400];
    } else if (tier == 'diamond') {
      return Colors.pink[900];
    }
    return Colors.white;
  }

  Map<String, Color> _correlationOverallColor(int correlationScore) {
    if (correlationScore <= 10) {
      return {'color': Colors.red[900], 'text': Colors.white};
    } else if (correlationScore > 10 && correlationScore <= 20) {
      return {'color': Colors.red, 'text': Colors.white};
    } else if (correlationScore > 20 && correlationScore <= 30) {
      return {'color': Colors.orange[900], 'text': Colors.white};
    } else if (correlationScore > 30 && correlationScore <= 40) {
      return {'color': Colors.orange, 'text': Colors.black};
    } else if (correlationScore > 40 && correlationScore <= 50) {
      return {'color': Colors.yellow[800], 'text': Colors.black};
    } else if (correlationScore > 50 && correlationScore <= 60) {
      return {'color': Colors.yellow[400], 'text': Colors.black};
    } else if (correlationScore > 60 && correlationScore <= 70) {
      return {'color': Colors.green, 'text': Colors.white};
    } else if (correlationScore > 70 && correlationScore <= 80) {
      return {'color': Colors.lightGreen[900], 'text': Colors.white};
    } else if (correlationScore > 80 && correlationScore <= 90) {
      return {'color': Colors.indigo[900], 'text': Colors.white};
    } else if (correlationScore > 90 && correlationScore <= 100) {
      return {'color': Colors.grey[900], 'text': Colors.white};
    } else
      return {'color': Colors.white, 'text': Colors.black};
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
              padding: EdgeInsets.only(left: 10),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Correlation Score:'),
                      Container(
                        // margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                          child: Text(
                            '${widget.correlationScore}',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle
                                .copyWith(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: _correlationOverallColor(
                                      widget.correlationScore)['text'],
                                ),
                          ),
                        ),
                        decoration: ShapeDecoration(
                          color: _correlationOverallColor(
                              widget.correlationScore)['color'],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 5,
                              color: _tierColor(widget.tier),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                      ),
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
