import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mastermind_finals/screen/global_providers.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mastermind_finals/global_providers.dart';
import 'package:mastermind_finals/service/models/answer.dart';
import 'dart:io';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counterList = useState([1, 2, 3, 4]);
    final container = ProviderContainer();
    final answerService = container.read(answerServiceProvider);
    answerService.createAnswers();
    answerService.viewAnswer();

    void addCounter(int position) {
      if (counterList.value[position] == 8) {
        counterList.value = [...counterList.value];
        counterList.value[position] = 1;
      } else {
        counterList.value = [...counterList.value];
        counterList.value[position]++;
      }
    }

    void subCounter(int position) {
      if (counterList.value[position] == 1) {
        counterList.value = [...counterList.value];
        counterList.value[position] = 8;
      } else {
        counterList.value = [...counterList.value];
        counterList.value[position]--;
      }
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
                "Mastermind",
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
                      Expanded(
                        child: Align(
                          alignment: Alignment.center, // Center the "0"
                          child: Text(
                            "0",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 100, // Large font to fill the space
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
                      Expanded(
                        child: Align(
                          alignment: Alignment.center, // Center the "0"
                          child: Text(
                            "0",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 100, // Large font to fill the space
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
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          addCounter(0);
                          print(counterList.value[0]);
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
                            "${counterList.value[0]}",
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
                          subCounter(0);
                          print("ok");
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
                          print("ok");
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
                          print("ok");
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
                          print("ok");
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
              width: 175,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: const Color.fromARGB(255, 43, 91, 16),
                  width: 5,
                ),
              ),
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    answerService.viewAnswer();
                    print("ok");
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
                    elevation:
                        MaterialStateProperty.all(0), // No shadow on hover
                    overlayColor: MaterialStateProperty.all(
                        Colors.transparent), // No hover effect color change
                    splashFactory:
                        NoSplash.splashFactory, // Disable splash effect
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
