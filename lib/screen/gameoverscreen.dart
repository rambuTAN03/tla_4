import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mastermind_finals/screen/startscreen.dart';

class GameOverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AudioPlayer _audioPlayer = AudioPlayer();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int result =
          await _audioPlayer.play('assets/audio/game_over.mp3', isLocal: true);
      if (result == 1) {
        print('Audio is playing');
      } else {
        print('Error playing audio');
      }
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              Duration(milliseconds: 500), // Adjust the duration here
          pageBuilder: (context, animation, secondaryAnimation) =>
              StartScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
              ),
              Center(
                child: Text(
                  "GAME\nOVER",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 43, 91, 16),
                    fontFamily: 'PixelifySans',
                    fontSize: 75,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
