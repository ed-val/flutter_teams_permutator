import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/dummy/cupertino_dummy_screen.dart';
import 'package:teams_permutator/screens/tabs/tabs_screen.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');
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
      key: _homeKey,
      child: CustomScrollView(
        semanticChildCount: 1,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            // transitionBetweenRoutes: true,
            // trailing: buildNavButton(),
            leading: const Text(''),
            backgroundColor: Colors.white,
            largeTitle: Text(''),
            middle: Text('Willkommen'),
          ),
          SliverPadding(
            padding: MediaQuery.of(context).removePadding(
              removeTop: true,
              removeLeft: true,
              removeRight: true,
            ).padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: buildNavButton(context),
                  ),
                );
              },
              childCount: 1,
              )
            ),
          ),
        ],
      )
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
            CupertinoPageRoute(builder: (ctx) => TabsScreen(),),
            // TabsScreen.routeName
          );
        },
      ),
    );
  }
}
