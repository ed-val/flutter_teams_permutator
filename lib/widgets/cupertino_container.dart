import 'package:flutter/material.dart';

class CupertinoContainer extends StatelessWidget {
  final Widget child;
  CupertinoContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
    );
  }
}
