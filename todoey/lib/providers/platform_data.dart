import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformData extends ChangeNotifier {
  bool kIsWeb;

  PlatformData() {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        kIsWeb = false;
      } else {
        kIsWeb = true;
      }
    } catch (e) {
      // Web won't support check of platform, therefore set kIsWeb to true
      kIsWeb = true;
    }
  }
}