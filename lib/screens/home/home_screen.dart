import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/tabs/tabs_screen.dart';
import 'package:teams_permutator/screens/home/correlation_item.dart';
import 'package:teams_permutator/widgets/backdrop_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const IconData searchIcon = IconData(0xf4a7,
      fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');
  GlobalKey<FormState> _homeKey =
      GlobalKey<FormState>(debugLabel: '_homeScreenkey');
  @override
  // void initState() {
  //   super.initState();
  // }
  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              _buildCupertinoNavigationBar(),
              SliverGrid.count(
                // this aspect ratio WILL DETERMINE CONTAINER'S SIZE (height) !!!!
                childAspectRatio: 40 / 25,
                crossAxisCount: orientation == Orientation.landscape ? 2 : 1,
                children: <Widget>[
                  CorrelationItem(
                    awayScore: 3,
                    homeScore: 4,
                    teamAway: 'REAL MADRID',
                    teamHome: 'BAYERN MUNCHEN',
                    dominion: -1,
                    // implement enums
                    tier: 'diamond',
                    correlationScore: 95,
                  ),
                ],
              )
            ],
          ),
          BackdropBottomSheet(
            sidesBorder: 10.0,
            heightInPercentage: 0.55,
            child: Text('lol jk, aint shit here yet'),
            titleHeader: 'Drag or press to show content',
          ),
        ],
      ),
    );
  }

  Widget _buildCupertinoNavigationBar() {
    return CupertinoSliverNavigationBar(
      largeTitle: Text('Willkommen'),
      trailing: CupertinoButton(
        child: Container(
          // compensate for unavoidable parent's padding
          transform: Matrix4.translationValues(0.0, -10, 0.0),
          child: Text(
            'Teams',
            // fixed trimmed text caused for parent's padding
            overflow: TextOverflow.visible,
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (ctx) => TabsScreen(),
            ),
            // TabsScreen.routeName
          );
        },
      ),
    );

    CupertinoNavigationBar(
      backgroundColor: Colors.grey[50],
      automaticallyImplyLeading: true,
      middle: Text('Willkommen'),
      trailing: CupertinoButton(
        child: Container(
          // compensate for unavoidable parent's padding
          transform: Matrix4.translationValues(0.0, -10, 0.0),
          child: Text(
            'Teams',
            // fixed trimmed text caused for parent's padding
            overflow: TextOverflow.visible,
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (ctx) => TabsScreen(),
            ),
            // TabsScreen.routeName
          );
        },
      ),
    );
  }
}
