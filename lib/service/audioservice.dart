// import 'package:riverpod/riverpod.dart';
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audio_service/audio_service.dart';
// import 'package:just_audio/just_audio.dart';

// class Audioservice {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   String _selectedAudio = 'assets/audio/song1.mp3';

//   // List of audio file paths
//   List<String> _audioFiles = [
//     'assets/audio/win.mp3',
//     'assets/audio/counter.mp3',
//     'assets/audio/up_down.mp3',
//   ];

//   void _playAudio(String audioPath) async {
//     await _audioPlayer.setAsset(audioPath);  // Load the asset into the player
//     await _audioPlayer.play();  // Play the audio
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();  // Dispose the player when done
//     super.dispose();
//   }
// }
