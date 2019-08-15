import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teams_permutator/screens/home/home_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

// Navigator.push(
//     context, CupertinoPageRoute(builder: (context) => Screen2()))

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // used in Android only
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
       statusBarColor: Colors.transparent
    ));
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
