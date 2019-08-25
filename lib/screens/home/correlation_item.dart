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

  Map<String, Color> _tierColor(String tier) {
    if (tier == 'bronze') {
      return {'main': Colors.brown[200], 'contrast': Colors.brown[600]};
    } else if (tier == 'silver') {
      return {'main': Colors.grey[300], 'contrast': Colors.grey[600]};
    } else if (tier == 'gold') {
      return {'main': Colors.amber[200], 'contrast': Colors.amber[500]};
    } else if (tier == 'platinum') {
      return {'main': Colors.blue[200], 'contrast': Colors.blue};
    } else if (tier == 'diamond') {
      return {'main': Colors.deepPurple[200], 'contrast': Colors.pink[900]};
    }
    return {'main': Colors.white, 'contrast': Colors.white};
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
      borderColor: _tierColor(widget.tier)['contrast'],
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: RadialChart(
              drawPercentage: 5,
              losePercentage: 15,
              winPercentage: 80,
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
                                ),
                          ),
                        ),
                        decoration: ShapeDecoration(
                          color: _tierColor(widget.tier)['main'],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 5,
                              color: _tierColor(widget.tier)['main'],
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
