import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teams_permutator/screens/home/home_screen.dart';
import 'package:teams_permutator/screens/home/home_screen.dart';
// import 'package:teams_permutator/screens/tabs/tabs_screen.dart';

class PermutatorScreen extends StatefulWidget {
  static const routeName = '/permutator_screen';

  @override
  _PermutatorScreenState createState() => _PermutatorScreenState();
}

class _PermutatorScreenState extends State<PermutatorScreen> {
  final GlobalKey<FormState> _permutatorKey = GlobalKey<FormState>(debugLabel: '_permutatorKey');

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        key: _permutatorKey,
        semanticChildCount: 1,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.transparent,
            leading: buildLeading(context),
            transitionBetweenRoutes: true,
            previousPageTitle: 'Home',
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverPadding(
            // Top media padding consumed by CupertinoSliverNavigationBar.
            // Left/Right media padding consumed by Tab1RowItem.
            padding: MediaQuery.of(context).removePadding(
              removeTop: true,
              removeLeft: true,
              removeRight: true,
            ).padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Text('Willkommen zu Permutator'),
                  ),
                );
              },
              childCount: 1,
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeading(BuildContext context) {
    return FittedBox(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushReplacement(
            CupertinoPageRoute(builder: (ctx) => HomeScreen(),),
            // TabsScreen.routeName
          );
          },
          child: Row(
            children: <Widget>[
              Icon(CupertinoIcons.left_chevron),
              Text('Home', style: CupertinoTheme.of(context).textTheme.actionTextStyle),
            ],
          ), 
        )
      ),
    );
  }
}
