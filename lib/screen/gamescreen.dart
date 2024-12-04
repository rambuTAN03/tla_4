import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mastermind_finals/screen/gameoverscreen.dart';
import 'package:mastermind_finals/screen/global_providers.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mastermind_finals/screen/global_providers.dart';
import 'package:mastermind_finals/service/models/answer.dart';
import 'dart:io';
import 'package:mastermind_finals/screen/winscreen.dart';
import 'package:audioplayers/audioplayers.dart';

class GameScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayer = useMemoized(() => AudioPlayer(), []);

    final counterList = useState([0, 0, 0, 0]);
    final answerList = useState([0, 0, 0, 0]);
    final correctColors = useState(0);
    final gameStarted = useState(false);
    final correctPosition = useState(0);
    final score = useState(0);
    final turns = useState(0);
    final container = ProviderContainer();
    final answerService = container.read(answerServiceProvider);

    answerService.createAnswers();
    final Answer pattern = answerService.assignPattern();

    void playUpDown() async {
      int result =
          await audioPlayer.play('assets/audio/up_down.mp3', isLocal: true);
      if (result == 1) {
        print('Audio is playing');
      } else {
        print('Error playing audio');
      }
    }

    // void playWin() async {
    //   int result =
    //       await audioPlayer.play('assets/audio/win.mp3', isLocal: true);
    //   if (result == 1) {
    //     print('Audio is playing');
    //   } else {
    //     print('Error playing audio');
    //   }
    // }

    void playRise() async {
      int result = await audioPlayer.play('assets/audio/before_counter.mp3',
          isLocal: true);
      if (result == 1) {
        print('Audio is playing');
      } else {
        print('Error playing audio');
      }
    }

    void playDing() async {
      int result =
          await audioPlayer.play('assets/audio/counter.mp3', isLocal: true);
      if (result == 1) {
        print('Audio is playing');
      } else {
        print('Error playing audio');
      }
    }

    void checkTurns() {
      if (turns.value <= 10) {
        turns.value++;
      } else {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                GameOverScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      }
    }

    Future<void> checkPattern() async {
      if (gameStarted.value) {
        int correctColor = 0;
        int correctColorAndPosition = 0;

        if (counterList.value[0] == answerList.value[0]) {
          correctColorAndPosition++;
        }
        if (counterList.value[1] == answerList.value[1]) {
          correctColorAndPosition++;
        }
        if (counterList.value[2] == answerList.value[2]) {
          correctColorAndPosition++;
        }
        if (counterList.value[3] == answerList.value[3]) {
          correctColorAndPosition++;
        }

        if (correctColorAndPosition == 4 && gameStarted.value) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  WinScreen(
                      score: score.value + (10000 * (13 - (turns.value)))),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        } else {
          List<int> skip = [0, 0, 0, 0];
          for (int i = 0; i < 4; i++) {
            for (int p = 0; p < 4; p++) {
              if (counterList.value[i] == answerList.value[p]) {
                if (skip.contains(counterList.value[i])) {
                  break;
                }
                skip[i] = counterList.value[i];
                correctColor++;
                break;
              }
            }
          }
          //correctColors.value = correctColor;
          for (int i = 1; i <= correctColor; i++) {
            if (i < correctColor) {
              //not last

              await Future.delayed(Duration(milliseconds: 500));
              final random = Random();
              final randomNumber =
                  random.nextInt(10); // Random number between 0 and 9
              correctPosition.value = randomNumber;
              playRise();
              correctColors.value = i;
            } else {
              //last

              await Future.delayed(Duration(seconds: 1));
              playDing();
              correctColors.value = i;
            }
          }
          checkTurns();
          correctPosition.value = correctColorAndPosition;
          int correctColorScore = correctColor - correctColorAndPosition;
          score.value += correctColorScore * 1250;
          score.value += correctColorAndPosition * 2500;
          print(score.value);
        }
      }
    }

    void quitGame() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
              GameOverScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    }

    void addCounter(int position) {
      if (counterList.value[0] == 0 &&
          counterList.value[1] == 0 &&
          counterList.value[2] == 0 &&
          counterList.value[3] == 0) {
        answerList.value[0] = pattern.first;
        answerList.value[1] = pattern.second;
        answerList.value[2] = pattern.third;
        answerList.value[3] = pattern.fourth;
        gameStarted.value = true;
      }
      if (counterList.value[position] == 8) {
        final newCounter = List<int>.from(counterList.value);
        newCounter[position] = 1;
        counterList.value = newCounter;
      } else {
        final newCounter = List<int>.from(counterList.value);
        newCounter[position]++;
        counterList.value = newCounter;
      }
      print(answerList);
    }

    void subCounter(int position) {
      if (counterList.value[0] == 0 &&
          counterList.value[1] == 0 &&
          counterList.value[2] == 0 &&
          counterList.value[3] == 0) {
        answerList.value[0] = pattern.first;
        answerList.value[1] = pattern.second;
        answerList.value[2] = pattern.third;
        answerList.value[3] = pattern.fourth;
        gameStarted.value = true;
      }
      if (counterList.value[position] == 1 ||
          counterList.value[position] == 0) {
        final newCounter = List<int>.from(counterList.value);
        newCounter[position] = 8;
        counterList.value = newCounter;
      } else {
        final newCounter = List<int>.from(counterList.value);
        newCounter[position]--;
        counterList.value = newCounter;
      }
      print(answerList);
    }

    useEffect(() {
      return () {
        audioPlayer.dispose();
      };
    }, [audioPlayer]);

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "MASTERMIND",
                style: TextStyle(
                  color: const Color.fromARGB(255, 43, 91, 16),
                  fontFamily: 'PixelifySans',
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              height: 30,
            ),
            Center(
              child: Text(
                "TURN ${turns.value + 1}",
                style: TextStyle(
                  color: const Color.fromARGB(255, 43, 91, 16),
                  fontFamily: 'PixelifySans',
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: const Color.fromARGB(255, 43, 91, 16),
                      width: 5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Number",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment.center, // Center the "0"
                          child: Text(
                            "${correctColors.value}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 75, // Large font to fill the space
                            ),
                            textAlign:
                                TextAlign.center, // Ensure the text is centered
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: const Color.fromARGB(255, 43, 91, 16),
                      width: 5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Position",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment.center, // Center the "0"
                          child: Text(
                            "${correctPosition.value}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 75, // Large font to fill the space
                            ),
                            textAlign:
                                TextAlign.center, // Ensure the text is centered
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 15,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Increment Button
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          addCounter(
                              0); // Increment the first counter in the list
                          print(counterList.value[0]);
                        },
                        child: Text(
                          "Up",
                          style: TextStyle(
                            color: Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
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
                      // Counter Display Container
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Color.fromARGB(255, 43, 91, 16),
                            width: 5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${counterList.value[0]}", // Display the counter value
                            style: TextStyle(
                              color: Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 45,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      // Decrement Button
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          subCounter(
                              0); // Decrement the first counter in the list
                        },
                        child: Text(
                          "Down",
                          style: TextStyle(
                            color: Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
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
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          addCounter(1);
                          print(counterList.value[1]);
                        },
                        child: Text(
                          "up",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            width: 5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${counterList.value[1]}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 45, // Large font to fill the space
                            ),
                            textAlign:
                                TextAlign.center, // Ensure the text is centered
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          subCounter(1);
                        },
                        child: Text(
                          "down",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          addCounter(2);
                          print(counterList.value[2]);
                        },
                        child: Text(
                          "up",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            width: 5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${counterList.value[2]}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 45, // Large font to fill the space
                            ),
                            textAlign:
                                TextAlign.center, // Ensure the text is centered
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          subCounter(2);
                        },
                        child: Text(
                          "down",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          addCounter(3);
                          print(counterList.value[3]);
                        },
                        child: Text(
                          "up",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            width: 5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${counterList.value[3]}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 45, // Large font to fill the space
                            ),
                            textAlign:
                                TextAlign.center, // Ensure the text is centered
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          playUpDown();
                          subCounter(3);
                        },
                        child: Text(
                          "down",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
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
                          checkPattern();
                        },
                        child: Text(
                          "PASS",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 50,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                    ),
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
                          quitGame();
                        },
                        child: Text(
                          "QUIT",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 50,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Set the background color to black
                          // Set text color (optional, already set in Text)
                        ).copyWith(
                          // Disable hover effects
                          elevation: MaterialStateProperty.all(
                              0), // No shadow on hover
                          overlayColor: MaterialStateProperty.all(Colors
                              .transparent), // No hover effect color change
                          splashFactory:
                              NoSplash.splashFactory, // Disable splash effect
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
