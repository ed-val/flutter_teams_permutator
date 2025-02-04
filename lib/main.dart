import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teams_permutator/screens/home/home_screen.dart';
// import 'package:teams_permutator/screens/permutator/permutator_screen.dart';
// import 'package:teams_permutator/screens/singleTeam/single_team_screen.dart';
import 'package:teams_permutator/screens/tabs/tabs_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

// Navigator.push(
//     context, CupertinoPageRoute(builder: (context) => Screen2()))

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // used in Android only
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      // statusBarBrightness: Brightness.dark,
      // statusBarIconBrightness: Brightness.dark,
    ));
    return CupertinoApp(
      title: 'Permutator',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        primaryContrastingColor: CupertinoColors.inactiveGray,
        scaffoldBackgroundColor: Colors.white,
        // dont use Colors.transparent: Current bug turns icons white
        barBackgroundColor: Colors.white10,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.black,
          navLargeTitleTextStyle: TextStyle(
            color: Colors.grey[850],
            fontSize: 32,
            fontFamily: 'SF UI Display',
            fontWeight: FontWeight.w700,
          ),
          navTitleTextStyle: TextStyle(
            color: Colors.grey[850],
            fontSize: 24,
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
            color: CupertinoColors.activeBlue,
            fontSize: 16,
            fontFamily: 'SF Compact Rounded',
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        // DummyScreen.routeName: (ctx) => DummyScreen(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   if (settings.name == '/tabs') {
      //     return CupertinoPageRoute(builder: (ctx) => TabsScreen(),);
      //   } else if (settings.name == '/') {
      //     return CupertinoPageRoute(builder: (ctx) => HomeScreen(),);
      //   } else if (settings.name == '/dummy') {
      //     return CupertinoPageRoute(builder: (ctx) => DummyScreen(),);
      //   }
      //    return CupertinoPageRoute(builder: (ctx) => HomeScreen(),);
      // },
      onUnknownRoute: (settings) {
        // called when even OnGenerateRoute fails. Like the 404 not found for web
        return CupertinoPageRoute(
          builder: (ctx) => HomeScreen(),
        );
      },
    );
  }
}
