// import 'package:flutter/material.dart';
import 'dart:async';

class ExampleBloc {
  CommentsBloc() {}
  final _exampleOutput = StreamController<Map<int, Future>>();

  // getters to stream
  // StreamController<Map<int, Future>> get example => _exampleOutput.stream;

  // getters to sink
  // Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  // transformers
  _exampleTransformer() {
    // the scanstreamtransformer will accept int and return maps with int keys and future values
    // return ScanStreamTransformer<int, Map<int, Future>>(
    //     // critical to return cache ALWAYS return cache
    //     return cache;
    //   },
    //   <int, Future<ItemModel>>{},
    // );
  }

  dispose() {
    // _commentsFetcher.close();
    // _commentsOutput.close();
  }
}
