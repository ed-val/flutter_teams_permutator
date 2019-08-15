import 'package:flutter/cupertino.dart';

class PermutatorScreen extends StatelessWidget {
  const PermutatorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Permutator'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Hi'),
          onPressed: () {},
        ),
      ),
    );
  }
}
