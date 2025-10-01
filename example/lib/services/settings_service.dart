import 'package:shared_preferences/shared_preferences.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;

class SettingsService {
  static const String _mnemonicKey = 'user_mnemonic';
  static const String _nodeNameKey = 'node_name';
  static const String _portKey = 'node_port';
  static const String _isFirstRunKey = 'is_first_run';

  // Check if this is the first time running the app
  static Future<bool> isFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstRunKey) ?? true;
  }

  // Mark first run as complete
  static Future<void> markFirstRunComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstRunKey, false);
  }

  // Generate a new mnemonic
  static Future<String> generateMnemonic() async {
    final mnemonic = await ldk.Mnemonic.generate();
    return mnemonic.words.join(" ");
  }

  // Save user mnemonic
  static Future<void> saveMnemonic(String mnemonic) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_mnemonicKey, mnemonic);
  }

  // Get user mnemonic
  static Future<String?> getMnemonic() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_mnemonicKey);
  }

  // Save node name
  static Future<void> saveNodeName(String nodeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nodeNameKey, nodeName);
  }

  // Get node name
  static Future<String?> getNodeName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nodeNameKey);
  }

  // Save port
  static Future<void> savePort(int port) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_portKey, port);
  }

  // Get port
  static Future<int?> getPort() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_portKey);
  }

  // Get all user settings
  static Future<Map<String, dynamic>> getUserSettings() async {
    final mnemonic = await getMnemonic();
    final nodeName = await getNodeName();
    final port = await getPort();

    return {
      'mnemonic': mnemonic,
      'nodeName': nodeName,
      'port': port,
    };
  }

  // Save all user settings
  static Future<void> saveUserSettings({
    required String mnemonic,
    required String nodeName,
    required int port,
  }) async {
    await saveMnemonic(mnemonic);
    await saveNodeName(nodeName);
    await savePort(port);
  }

  // Clear all settings (for testing/reset)
  static Future<void> clearAllSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_mnemonicKey);
    await prefs.remove(_nodeNameKey);
    await prefs.remove(_portKey);
    await prefs.remove(_isFirstRunKey);
  }
}
