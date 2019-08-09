import 'package:flutter/material.dart';
// export 'package:flutter_teams_permutator/lib/blocs/example_bloc.dart';

// The purpose of the provider is to make available a certain BloC to all our app

// class ExampleProvider extends InheritedWidget {
//   // remember again that the inheritedWidget is the one capable of searching a given Provider
//   // throughout a context that is passed onto him to then be able to return the bloc contained here
//   final ExampleBloc bloc;

//   ExampleProvider({Key key, Widget child})
//       : bloc = ExampleBloc(),
//         // when we use the 'super' key we're essentially passing on props to the extended class
//         // in this case we're sending a prop key of value key and a child of value child to inheritedwidget
//         super(key: key, child: child);

//   bool updateShouldNotify(_) => true;

//   static ExampleBloc of(BuildContext context) {
//     return (context.inheritFromWidgetOfExactType(ExampleProvider)
//             as ExampleProvider)
//         .bloc;
//   }
// }
