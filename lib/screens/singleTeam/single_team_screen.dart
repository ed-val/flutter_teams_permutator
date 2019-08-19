import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleTeamScreen extends StatelessWidget {
  static const routeName = '/single_team_screen';
  const SingleTeamScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        middle: Text('Analize Team'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {},
          child: Text('This is a tab'),
        ),
      ),
    );
  }
}
