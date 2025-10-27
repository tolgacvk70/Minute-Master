import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  void playTick() {
    SystemSound.play(SystemSoundType.click);
  }

  void playBuzz() {
    SystemSound.play(SystemSoundType.alert);
  }

  void playApplause() {
    SystemSound.play(SystemSoundType.click);
  }

  void playConfetti() {
    SystemSound.play(SystemSoundType.click);
  }
}

