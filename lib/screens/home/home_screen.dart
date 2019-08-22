import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/tabs/tabs_screen.dart';
import 'package:teams_permutator/widgets/backdrop_bottom_sheet.dart';
import 'package:teams_permutator/widgets/cupertino_container.dart';
import 'package:teams_permutator/widgets/radial_chart.dart';
// import 'package:teams_permutator/widgets/persisten_bottom_sheet.dart';

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
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: buildCupertinoNavigationBar(),
              ),
              SliverGrid.count(
                crossAxisCount: orientation == Orientation.landscape ? 2 : 1,
                children: <Widget>[
                  CupertinoContainer(
                    child: RadialChart(),
                  ),
                  CupertinoContainer(
                    child: RadialChart(),
                  ),
                  CupertinoContainer(
                    child: RadialChart(),
                  ),
                  CupertinoContainer(
                    child: RadialChart(),
                  ),
                  CupertinoContainer(
                    child: RadialChart(),
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

  Widget buildCupertinoNavigationBar() {
    return CupertinoNavigationBar(
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
