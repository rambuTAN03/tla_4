import 'package:flutter/material.dart';
import 'package:mastermind_finals/screen/gamescreen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void playGame() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => GameScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    }

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
                  "Welcome to",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 43, 91, 16),
                    fontFamily: 'PixelifySans',
                    fontSize: 40,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "MASTERMIND",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 43, 91, 16),
                    fontFamily: 'PixelifySans',
                    fontSize: 75,
                  ),
                ),
              ),
              Container(
                height: 150,
              ),
              Container(
                width: 175,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: const Color.fromARGB(255, 43, 91, 16),
                    width: 5,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      playGame();
                    },
                    child: Text(
                      "PLAY",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 43, 91, 16),
                        fontFamily: 'PixelifySans',
                        fontSize: 50,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ).copyWith(
                      elevation: MaterialStateProperty.all(0),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
