import 'package:flutter/cupertino.dart';

class SingleTeamScreen extends StatelessWidget {
  static const routeName = '/single_team_screen';
  const SingleTeamScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Analize Team'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Hallo'),
          onPressed: () {},
        ),
      ),
    );
  }
}
