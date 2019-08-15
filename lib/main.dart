import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryContrastingColor: Colors.blue,
      ),
      home: CupertinoPageScaffold(
        child: Container(
          alignment: Alignment.center,
          child: Text('Home Landing'),
        ),
      ),
    );
  }
}
