import 'package:flutter/material.dart';
import 'package:midterm_project/screen/screen1.dart';
import 'package:midterm_project/screen/screen2.dart';
import 'package:midterm_project/screen/screen3.dart';
import 'package:midterm_project/screen/screen4.dart';
import 'package:midterm_project/screen/screen5.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SizedBox(height: 20),
            ElevatedButton(
              //First Button
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child: Text('Screen 1', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              //Second Button
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child: Text('Screen 2', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              //Second Button
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child: Text('Screen 3', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              //Second Button
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child: Text('Screen 4', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              //Second Button
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child: Text('Screen 5', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FifthScreen()),
                );
              },
            ),
          ])),
    );
  }
}
