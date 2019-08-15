import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/permutator/permutator_screen.dart';
import 'package:teams_permutator/screens/singleTeam/single_team_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  final CupertinoTabController _tabController = CupertinoTabController();
  // int _selectedPageIndex = 0;

  @override
  // void initState() {
  //   super.initState();
  // }

  // void _selectPage(ctx, int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        // onTap: (int index) {
        //   switch (index) {
        //     case 0: return Navigator.of(context, rootNavigator: false).push(CupertinoPageRoute(builder: (context) => PermutatorScreen(),),);
        //     case 1: return Navigator.of(context, rootNavigator: false).push(CupertinoPageRoute(builder: (context) => SingleTeamScreen(),),);
        //   }
        //   return null;
        // },
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
