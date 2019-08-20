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

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  CupertinoTabController _cupertinoTabController =
      CupertinoTabController(initialIndex: 0);
  PageController _pageController = PageController(initialPage: 0);
  List<dynamic> tabList = [PermutatorScreen(), SingleTeamScreen()];
  double currentPageView = 0.0;
  bool isPageCanChanged = true;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPageView = _pageController.page;
      });
    });
    super.initState();
  }

  void manualTranstion(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  // onPageChange(int index, {PageController p, TabController t}) async {
  //   if (p != null) {
  //     //判断是哪一个切换
  //     isPageCanChanged = false;
  //     await mPageController.animateToPage(index,
  //         duration: Duration(milliseconds: 500),
  //         curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
  //     isPageCanChanged = true;
  //   } else {
  //     mTabController.animateTo(index); //切换Tabbar
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          // builds on demand with the builder
          child: SizedBox(
            // THIS DIMENSION IS NOT RIGHT, CHECK LATER
            height: 600,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              itemCount: tabList.length,
              onPageChanged: (index) {
                print(index);
                // as controller, doesnt need a setstate()
                _cupertinoTabController.index = index;
              },
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return tabList[index];
              },
            ),
          ),
        ),
        SizedBox(
          // THIS DIMENSION IS NOT RIGHT, CHECK LATER
          height: 200,
          child: CupertinoTabScaffold(
            resizeToAvoidBottomInset: true,
            controller: _cupertinoTabController,
            tabBar: CupertinoTabBar(
              onTap: (int index) {
                switch (index) {
                  case 0:
                    manualTranstion(index);
                    break;
                  case 1:
                    manualTranstion(index);
                    break;
                }
                return null;
              },
              border: const Border(
                top: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                    style: BorderStyle.solid),
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
                  return CupertinoTabView(
                    // build nothing
                    builder: (BuildContext context) => buildDummyTab(context),
                  );
                case 1:
                  return CupertinoTabView(
                    // build nothing
                    builder: (BuildContext context) => buildDummyTab(context),
                  );
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget buildDummyTab(BuildContext context) {
    return Container(child: SizedBox(height: 0, width: 0));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
