import 'package:flutter/material.dart';
import 'package:midterm_project/screen/screen1.dart';
import 'package:midterm_project/screen/screen2.dart';
import 'package:midterm_project/screen/screen3.dart';
import 'package:midterm_project/screen/screen4.dart';
import 'package:midterm_project/screen/screen5.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          print("ok");
                        },
                        child: Text(
                          "up",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            fontFamily: 'PixelifySans',
                            fontSize: 15,
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: const Color.fromARGB(255, 43, 91, 16),
                            width: 5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "0",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 43, 91, 16),
                              fontFamily: 'PixelifySans',
                              fontSize: 25, // Large font to fill the space
                            ),
                            textAlign:
                                TextAlign.center, // Ensure the text is centered
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
