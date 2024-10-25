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
              child: Text('Watch', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReccomendationScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              //Second Button
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child: Text('Post', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              //Second Button
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child:
                  Text('Create a Fundraiser', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FundraiserScreen()),
                );
              },
            ),
          ])),
    );
  }
}
