import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mastermind_finals/screen/global_providers.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mastermind_finals/screen/global_providers.dart';
import 'package:mastermind_finals/service/models/answer.dart';
import 'dart:io';
import 'package:mastermind_finals/screen/winscreen.dart';

class GameScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counterList = useState([0, 0, 0, 0]);
    final answerList = useState([0, 0, 0, 0]);
    final container = ProviderContainer();
    final answerService = container.read(answerServiceProvider);
    int test = 1;

    answerService.createAnswers();
    answerService.viewAnswer();
    final Answer pattern = answerService.assignPattern();

    void checkPattern() {
      int correctColorandPosition = 0;
      if (counterList.value[0] == answerList.value[0]) {
        correctColorandPosition++;
      }
      if (counterList.value[1] == answerList.value[1]) {
        correctColorandPosition++;
      }
      if (counterList.value[2] == answerList.value[2]) {
        correctColorandPosition++;
      }
      if (counterList.value[3] == answerList.value[3]) {
        correctColorandPosition++;
      }

      if (correctColorandPosition == 4) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WinScreen()));
      } else {
        print("Mali");
      }
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
                  fontSize: 32,
                ),
              ),
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
                          "Color",
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
                            "0",
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
                            "0",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Increment Button
                      ElevatedButton(
                        onPressed: () {
                          print(test);
                          test++;
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
                          answerService.viewAnswer();
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
