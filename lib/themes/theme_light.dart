import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    // swatch sets a primary and automatically sets a number of
    // props also for secondary color and some others
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    // you can also set some more colors, access them using context
    // anywhere inside your app
    // errorColor: Colors.red,
    fontFamily: 'Quicksand',
    textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          button: TextStyle(color: Colors.white),
        ),
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
    ),
  );
}
