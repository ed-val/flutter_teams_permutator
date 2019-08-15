import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/permutator/permutator_screen.dart';
import 'package:teams_permutator/screens/singleTeam/single_team_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages;
  // int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  // void _selectPage(ctx, int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.blue,
        backgroundColor: Colors.white70, //get blurr efect
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
      controller: CupertinoTabController(initialIndex: 0),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) => PermutatorScreen(),
              defaultTitle: 'Permutator',
            );
            break;
          case 1:
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
}
