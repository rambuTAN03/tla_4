import 'package:flutter/material.dart';

class WinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  "YOU\nWIN",
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
