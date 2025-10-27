import 'package:flutter/services.dart';

class HapticManager {
  static void lightFeedback() {
    HapticFeedback.lightImpact();
  }

  static void mediumFeedback() {
    HapticFeedback.mediumImpact();
  }

  static void heavyFeedback() {
    HapticFeedback.heavyImpact();
  }

  static void selectionFeedback() {
    HapticFeedback.selectionClick();
  }
}

