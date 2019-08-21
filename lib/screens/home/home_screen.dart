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
        backgroundColor: CupertinoTheme.of(context).primaryContrastingColor,
        border: Border.all(color: Colors.white),
        middle: Text('Willkommen'),
        trailing: Padding(
          padding: EdgeInsets.all(0),
          child: CupertinoButton(
            child: FittedBox(child: Text('Bottom Sheet')),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     fullscreenDialog: false,
              //     title: 'Backdrop',
              //     builder: (ctx) => BackdropDemo(),
              //   ),
              //   // TabsScreen.routeName
              // );
            },
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: buildNavButton(context),
          ),
          BackdropDemo(),
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
