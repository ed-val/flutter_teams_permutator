import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/tabs/tabs_screen.dart';
import 'package:teams_permutator/widgets/backdrop_bottom_sheet.dart';
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: true,
        // backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        border: Border.all(color: Colors.white),
        middle: Text('Willkommen'),
        trailing: Container(
          // compensate for parent's padding
          transform: Matrix4.translationValues(0.0, -10, 0.0),
          child: CupertinoButton(
            child: Icon(
              searchIcon,
              color: CupertinoTheme.of(context).primaryColor,
              size: 24.0,
            ),
            onPressed: () {},
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: buildNavButton(context),
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

  Widget buildNavButton(BuildContext context) {
    return Container(
      child: CupertinoButton(
        child: Row(
          children: <Widget>[
            Text('Go check teams!'),
            Icon(CupertinoIcons.right_chevron)
          ],
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
