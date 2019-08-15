import 'package:flutter/cupertino.dart';

class PermutatorScreen extends StatelessWidget {
  GlobalKey<FormState> _permutatorKey = GlobalKey<FormState>(debugLabel: '_permutatorKey');

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        key: _permutatorKey,
        semanticChildCount: 1,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverPadding(
            // Top media padding consumed by CupertinoSliverNavigationBar.
            // Left/Right media padding consumed by Tab1RowItem.
            padding: MediaQuery.of(context).removePadding(
              removeTop: true,
              removeLeft: true,
              removeRight: true,
            ).padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Text('Willkommen zu Permutator'),
                  ),
                );
              },
              )
            ),
          ),
        ],
      ),
    );
  }
}
