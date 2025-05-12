import 'package:flutter/foundation.dart';

import '../generated/frb_generated.dart';

class Frb {
  static Future<void> verifyInit() async {
    try {
      if (!core.instance.initialized) {
        await core.init();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to initialize ldk-node");
    }
  }
}
