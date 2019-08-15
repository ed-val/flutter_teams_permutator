import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teams_permutator/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Permutator',
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(
            color: Colors.grey[850],
            fontSize: 32,
            fontFamily: 'SF UI Display',
            fontWeight: FontWeight.w700,
          ),
          textStyle: TextStyle(
            color: Colors.grey[800],
            fontSize: 16,
            fontFamily: 'SF UI Text',
            fontWeight: FontWeight.w300,
          ),
          actionTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontFamily: 'SF Compact Rounded',
            fontWeight: FontWeight.w300,
          ),

          // body1: TextStyle(
          //   color: Color.fromRGBO(20, 51, 51, 1),
          // ),
          // body2: TextStyle(
          //   color: Color.fromRGBO(20, 51, 51, 1),
          // ),
          // title: TextStyle(
          //   fontSize: 20,
          //   fontFamily: 'RobotoCondensed',
          //   fontWeight: FontWeight.bold,
          // )),
        ),
        // barBackgroundColor: Colors.grey[350],
        primaryContrastingColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        // FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
