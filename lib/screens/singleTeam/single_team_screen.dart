import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teams_permutator/screens/home/home_screen.dart';
import 'package:teams_permutator/utils/sliver_delegate.dart';

class SingleTeamScreen extends StatefulWidget {
  static const routeName = '/permutator_screen';

  @override
  _SingleTeamScreenState createState() => _SingleTeamScreenState();
}

class _SingleTeamScreenState extends State<SingleTeamScreen> {
  final GlobalKey<FormState> _permutatorKey =
      GlobalKey<FormState>(debugLabel: '_permutatorKey');

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        key: _permutatorKey,
        semanticChildCount: 1,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Single Team Stats'),
            leading: CupertinoNavigationBarBackButton(
              previousPageTitle: 'Home',
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  CupertinoPageRoute(
                    builder: (ctx) => HomeScreen(),
                  ),
                  // HomeScreen.routeName,
                );
              },
            ),
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: SliverAppBarDelegate(
              child: PreferredSize(
                preferredSize: Size.fromHeight(40.0),
                child: Container(
                  color: CupertinoTheme.of(context).primaryContrastingColor,
                  height: 40,
                ),
              ),
            ),
          ),
          SliverPadding(
            // Top media padding consumed by CupertinoSliverNavigationBar.
            // Left/Right media padding consumed by Tab1RowItem.
            padding: MediaQuery.of(context)
                .removePadding(
                  removeTop: true,
                  removeLeft: true,
                  removeRight: true,
                )
                .padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Center(
                      child: Text('Willkommen zu Permutator'),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
