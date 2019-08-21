import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// One BackdropPanel is visible at a time. It's stacked on top of the
// the BackdropDemo.
class BackdropPanel extends StatelessWidget {
  const BackdropPanel({
    Key key,
    this.onTap,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.title,
    this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 15.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: Material(
        // elevation: 4.0,
        color: Colors.grey[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: onVerticalDragUpdate,
              onVerticalDragEnd: onVerticalDragEnd,
              onTap: onTap,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: MediaQuery.of(context).size.width * 0.006,
                          color: theme.primaryContrastingColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Center(
                    child: DefaultTextStyle(
                      style: theme.textTheme.textStyle,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: title,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 2.0,
              endIndent: 30,
              indent: 30,
              color: CupertinoColors.inactiveGray,
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class BackdropDemo extends StatefulWidget {
  /// How much real pixels away from the borders of the screen should the bottom sheet be.
  /// Expects a [double], defaults to [10.0].
  final double sidesBorder;

  /// Title to show in the header thats always displayed even when sheet is collapsed. Expects a [String]
  final String titleHeader;

  /// Child to pass on to the sheet, this will be render inside the sheet content spaces. Expexts any kind of [Widget].
  final Widget child;

  /// How far should the height of the bottom sheet go. JUST for the available space.
  /// Expects a [double] between [0.0 - 1.0], i.e. a value of 0.60 would make the sheet expand up to
  /// a 60% of the available space in screen IGNORING MediaQuery padding values and navigation header.
  /// Default is 100%, meaning it will take all space available on screen.
  final double heightInPercentage;

  const BackdropDemo({
    Key key,
    this.sidesBorder = 10.0,
    this.heightInPercentage = 1.0,
    this.titleHeader,
    this.child,
  }) : super(key: key);
  static const String routeName = '/material/backdrop';

  @override
  _BackdropDemoState createState() => _BackdropDemoState();
}

class _BackdropDemoState extends State<BackdropDemo>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;
  // Category _category = allCategories[0];

  @override
  void initState() {
    super.initState();
    // negative -2 value starts the backdrop collapsed. Use a positive 2.0
    // to start widget expanded
    _controller = AnimationController(
      duration: const Duration(milliseconds: 450),
      value: -2.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void openSheet() {
    setState(() {
      _controller.fling(velocity: 2.0);
    });
  }

  bool get _backdropPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropPanelVisibility() {
    _controller.fling(velocity: _backdropPanelVisible ? -2.0 : 2.0);
  }

  double get _backdropHeight {
    final RenderBox renderBox = _backdropKey.currentContext.findRenderObject();
    return renderBox.size.height * widget.heightInPercentage;
  }

  // By design: the panel can only be opened with a swipe. To close the panel
  // the user must either tap its heading or the backdrop's menu icon.

  void _handleDragUpdate(DragUpdateDetails details) {
    // if (_controller.isAnimating || _controller.status == AnimationStatus.completed)
    if (_controller.isAnimating) return;

    _controller.value -=
        details.primaryDelta / (_backdropHeight ?? details.primaryDelta);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / _backdropHeight;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      // threshold now to either collapse or expand is 0.5 (about 62% through)
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }

  // Stacks a BackdropPanel, which displays the selected category, on top
  // of the backdrop. The categories are displayed with ListTiles. Just one
  // can be selected at a time. This is a LayoutWidgetBuild function because
  // we need to know how big the BackdropPanel will be to set up its
  // animation.
  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double panelTitleHeight = 50.0;
    final Size panelSize = constraints.biggest;
    // print(panelSize.height);
    final double panelTop = panelSize.height - panelTitleHeight;

    final Animation<RelativeRect> panelAnimation = _controller.drive(
      RelativeRectTween(
        begin: RelativeRect.fromLTRB(
          widget.sidesBorder,
          panelTop - MediaQuery.of(context).padding.bottom,
          widget.sidesBorder,
          panelTop - panelSize.height,
        ),
        end: RelativeRect.fromLTRB(
          widget.sidesBorder,
          panelSize.height * (1.0 - widget.heightInPercentage),
          widget.sidesBorder,
          panelTop - panelSize.height,
        ),
      ),
    );

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        PositionedTransition(
          rect: panelAnimation,
          child: BackdropPanel(
            onTap: _toggleBackdropPanelVisibility,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            title: Text(widget.titleHeader),
            // child: CategoryView(category: _category),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: _buildStack,
    );
  }
}
