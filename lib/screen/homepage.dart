import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counterList = useState([1, 2, 3, 4]);

    void addCounter(int position) {
      if (position == 0) {
        if (counterList.value[0] == 9) {
          counterList.value[0] = 0;
        } else {
          counterList.value[0] += 1;
        }
      } else if (position == 1) {
      } else if (position == 2) {
      } else {}
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
                          print("ok");
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
                          print("ok");
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
                          print("ok");
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
