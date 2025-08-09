import 'package:flutter/foundation.dart';

class GoogleSignInConfig {
  static String get clientId {
    if (kIsWeb) {
      return '995356823510-is9p4904gpthvgvlb3hl66in0ppbakhr.apps.googleusercontent.com';
    } else {
      bool isRelease = bool.fromEnvironment('dart.vm.product');
      if (isRelease) {
        return '995356823510-hf0ispnor494kjvqb9rrv5niujjs0np6.apps.googleusercontent.com';
      } else {
        return '995356823510-rucj102uqjmg4bdtria3voe00am30kre.apps.googleusercontent.com';
      }
    }
  }
}
