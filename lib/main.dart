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
            fontSize: 32,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
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
