import 'package:flutter/material.dart';

class CupertinoContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color borderColor;
  CupertinoContainer(
      {Key key, this.child, this.height, this.width, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: child,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // border: Border.all(color: borderColor, width: 1),
        color: Colors.grey[50],
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
    );
  }
}
