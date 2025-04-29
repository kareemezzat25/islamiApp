import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Radioprovider extends ChangeNotifier {
  bool isPlaying = false;
  double currentVolume = 1;
  AudioPlayer player = AudioPlayer();
  String? currentPlayingUrl;

  Future<void> play(String url) async {
    if (url == currentPlayingUrl) {
      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      isPlaying = true;
      currentPlayingUrl = url;
      await player.play(UrlSource(url), volume: currentVolume);
    }
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    await player.setVolume(currentVolume);
    notifyListeners();
  }
}
