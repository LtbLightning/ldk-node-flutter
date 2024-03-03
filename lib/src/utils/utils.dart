import 'package:flutter/foundation.dart';

import '../generated/frb_generated.dart';

export 'exceptions.dart';

class Frb {
  static Future<void> verifyInit() async {
    try {
      if (!LdkCore.instance.initialized) {
        await LdkCore.init();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to initialize ldk-node");
    }
  }
}
