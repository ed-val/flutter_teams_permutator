import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/home/home_screen.dart';
import 'package:teams_permutator/screens/permutator/permutator_screen.dart';
import 'package:teams_permutator/screens/singleTeam/single_team_screen.dart';
import 'package:teams_permutator/utils/page_transitions.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  final CupertinoTabController _tabController =
      CupertinoTabController(initialIndex: 0);
  // int _selectedPageIndex = 0;

  // void goBack() {
  //   Navigator.popAndPushNamed(context, HomeScreen.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                EnterExitRoute(
                  exitPage: PermutatorScreen(),
                  enterPage: SingleTeamScreen(),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                EnterExitRoute(
                  exitPage: SingleTeamScreen(),
                  enterPage: PermutatorScreen(),
                ),
              );
              break;
          }
          return null;
        },
        border: const Border(
          top: BorderSide(
              color: Colors.transparent, width: 0.0, style: BorderStyle.solid),
        ),
        activeColor: Colors.blue,
        backgroundColor: Colors.transparent, //get blurr efect
        inactiveColor: Colors.grey[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(CupertinoIcons.shuffle),
            title: Text('Permutator'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(CupertinoIcons.group_solid),
            title: Text('Single Team'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            // _tabController.index = 0;
            return CupertinoTabView(
              builder: (BuildContext context) => PermutatorScreen(),
              defaultTitle: 'Permutator',
            );
            break;
          case 1:
            // _tabController.index = 1;
            return CupertinoTabView(
              builder: (BuildContext context) => SingleTeamScreen(),
              defaultTitle: 'Analize Team',
            );
            break;
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
