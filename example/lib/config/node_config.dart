import 'dart:io';
import '../services/settings_service.dart';

class NodeConfig {
  static const String _defaultNodeName = 'alice';
  static const String _defaultMnemonic =
      'cart super leaf clinic pistol plug replace close super tooth wealth usage';
  static const int _defaultPort = 9735;

  // Get node configuration based on environment or emulator instance
  static Future<Map<String, dynamic>> getNodeConfig() async {
    // First, try to get user settings
    final userSettings = await _getUserSettings();
    if (userSettings != null) {
      return userSettings;
    }

    // Check if we're running in a test environment
    if (Platform.environment.containsKey('NODE_NAME')) {
      return _getConfigFromEnv();
    }

    // Check if we're running in an emulator with specific port
    if (Platform.environment.containsKey('EMULATOR_PORT')) {
      return _getConfigFromEmulator();
    }

    // Default configuration
    return {
      'name': _defaultNodeName,
      'mnemonic': _defaultMnemonic,
      'port': _defaultPort,
    };
  }

  static Future<Map<String, dynamic>?> _getUserSettings() async {
    try {
      final settings = await SettingsService.getUserSettings();
      if (settings['mnemonic'] != null) {
        return {
          'name': settings['nodeName'] ?? _defaultNodeName,
          'mnemonic': settings['mnemonic'],
          'port': settings['port'] ?? _defaultPort,
        };
      }
    } catch (e) {
      // If settings service fails, fall back to other methods
    }
    return null;
  }

  static Map<String, dynamic> _getConfigFromEnv() {
    final nodeName = Platform.environment['NODE_NAME'] ?? _defaultNodeName;
    final port = int.tryParse(
            Platform.environment['NODE_PORT'] ?? _defaultPort.toString()) ??
        _defaultPort;

    // Use different mnemonics for different nodes
    final mnemonic = _getMnemonicForNode(nodeName);

    return {
      'name': nodeName,
      'mnemonic': mnemonic,
      'port': port,
    };
  }

  static Map<String, dynamic> _getConfigFromEmulator() {
    final port = int.tryParse(
            Platform.environment['EMULATOR_PORT'] ?? _defaultPort.toString()) ??
        _defaultPort;

    // Determine node name based on port
    final nodeName = port == 9735 ? 'alice' : 'bob';
    final mnemonic = _getMnemonicForNode(nodeName);

    return {
      'name': nodeName,
      'mnemonic': mnemonic,
      'port': port,
    };
  }

  static String _getMnemonicForNode(String nodeName) {
    switch (nodeName.toLowerCase()) {
      case 'alice':
        return 'cart super leaf clinic pistol plug replace close super tooth wealth usage';
      case 'bob':
        return 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';
      case 'carol':
        return 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo wrong';
      default:
        return _defaultMnemonic;
    }
  }

  // Helper method to get a unique port for testing
  static int getUniquePort() {
    final basePort = _defaultPort;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return basePort +
        (timestamp % 1000); // Add random offset to avoid conflicts
  }

  // Get display name for the current node
  static Future<String> getDisplayName() async {
    final config = await getNodeConfig();
    return config['name'] as String;
  }

  // Get port for the current node
  static Future<int> getPort() async {
    final config = await getNodeConfig();
    return config['port'] as int;
  }

  // Get mnemonic for the current node
  static Future<String> getMnemonic() async {
    final config = await getNodeConfig();
    return config['mnemonic'] as String;
  }
}
