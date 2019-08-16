import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teams_permutator/screens/tabs/tabs_screen.dart';

class DummyScreen extends StatefulWidget {
  
  DummyScreen({Key key}) : super(key: key);
  static const routeName = '/dummy';
  @override
  _DummyScreenState createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  GlobalKey<FormState> _dummyKey = GlobalKey<FormState>(debugLabel: '_dummyKey');
  @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        key: _dummyKey,
        semanticChildCount: 1,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            
            previousPageTitle: 'Home',
            // transitionBetweenRoutes: true,
            // trailing: buildNavButton(),
            // leading: const Text('Dummy Screen'),
            backgroundColor: Colors.white,
            largeTitle: Text('Dummy Screen'),
            // middle: Text('Dummy'),
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
                    child: buildNavButton(),
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

  Widget buildNavButton() {
    return Container(
      child: CupertinoButton(
        child: Row(
          children: <Widget>[
            Text('< Go back!'),
            // Icon(CupertinoIcons.right_chevron)
          ],
        ), 
        onPressed: () {
          // Navigator.of(context).pop();
        },
      ),
    );
  }
}