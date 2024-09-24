import 'package:flutter/services.dart' show rootBundle;
import 'package:ini/ini.dart';

class ConfigService {
  static String _baseUrl = '';

  static Future<void> loadConfig() async {
    // Load the env.ini file from assets
    String configContent = await rootBundle.loadString('assets/cfg/env.ini');
    // Parse the ini file
    Config config = Config.fromString(configContent);
    // Extract the base URL from the ini file
    _baseUrl = config.get('API', 'base_url') ?? '';
  }

  static String get baseUrl => _baseUrl;
}
