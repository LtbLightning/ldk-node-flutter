import 'package:flutter/foundation.dart';

import '../generated/bindings.dart';

class LdkEventHandler {
  final Stream<LogEntry> callback;
  LdkEventHandler({required this.callback});

  init() {
    callback.listen((e) {
      if (kDebugMode) {
        print(e.msg.toString());
      }
    });
  }
}
