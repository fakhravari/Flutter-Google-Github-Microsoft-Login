import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class GoogleSignInConfig {
  static Map<String, dynamic>? _config;

  static Future<void> loadConfig() async {
    final jsonString = await rootBundle.loadString(
      'assets/config/google_sign_in_config.json',
    );
    _config = json.decode(jsonString);
  }

  static String get clientId {
    assert(_config != null, 'Config not loaded! Call loadConfig() first.');

    if (kIsWeb) {
      return _config!['web'];
    } else {
      final isRelease = bool.fromEnvironment('dart.vm.product');
      if (defaultTargetPlatform == TargetPlatform.android) {
        return isRelease
            ? _config!['android_release']
            : _config!['android_debug'];
      } else {
        throw UnsupportedError('Platform not supported');
      }
    }
  }
}
