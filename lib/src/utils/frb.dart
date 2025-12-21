import 'package:ldk_node/src/utils/exceptions.dart';

import '../generated/frb_generated.dart';

class Frb {
  static Future<void> verifyInit() async {
    try {
      if (!core.instance.initialized) {
        await core.init();
      }
    } catch (e) {
      throw BridgeException(errorMessage: e.toString(), code: "InitializationError");
    }
  }
}
