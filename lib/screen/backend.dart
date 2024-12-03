import 'package:mastermind_finals/screen/global_providers.dart';
import 'package:mastermind_finals/service/models/answer.dart';
import 'package:riverpod/riverpod.dart';
import 'dart:io';

void main() {
  final container = ProviderContainer();
  final answerService = container.read(answerServiceProvider);
  final playerService = container.read(playerServiceProvider);
  bool running = true;

  while (running) {
    print('\nWELCOME TO MY LAIR');
    print('1. Play');
    print('2. Rules');
    print('3. Leaderboards');
    print('4. exit');
    print('Please enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        answerService.createAnswers();
        Answer pattern = answerService.assignPattern();

        List<int> _answer = [0, 0, 0, 0];
        _answer[0] = pattern.first;
        _answer[1] = pattern.second;
        _answer[2] = pattern.third;
        _answer[3] = pattern.fourth;

        bool guessed = false;
        int turns = 1;
        outerLoop:
        while (turns <= 12) {
          List<String> _guess = ["", "", "", ""];
          int correctColorAndPlace = 0;
          int correctColorButWrongPlace = 0;

          print("\nTURN $turns:");
          print("");
          print('First choice: ');
          String? firstResponse = stdin.readLineSync();
          _guess[0] = firstResponse!;
          if (firstResponse.isEmpty) {
            print("\nInvalid input, must not be a duplicate or null\n");
            continue outerLoop;
          }
          print('Second choice: ');
          String? secondResponse = stdin.readLineSync();
          _guess[1] = secondResponse!;
          if (secondResponse == firstResponse || secondResponse.isEmpty) {
            print("\nInvalid input, must not be a duplicate or null\n");
            continue outerLoop;
          }
          print('Third choice: ');
          String? thirdResponse = stdin.readLineSync();
          _guess[2] = thirdResponse!;
          if (thirdResponse == firstResponse ||
              thirdResponse == secondResponse ||
              thirdResponse.isEmpty) {
            print("\nInvalid input, must not be a duplicate or null\n");
            continue outerLoop;
          }

          print('Fourth choice: ');
          String? fourtResponse = stdin.readLineSync();
          _guess[3] = fourtResponse!;
          if (fourtResponse == firstResponse ||
              fourtResponse == secondResponse ||
              fourtResponse == thirdResponse ||
              fourtResponse.isEmpty) {
            print("\nInvalid input, must not be a duplicate or null\n");
            continue outerLoop;
          }

          if (firstResponse == _answer[0]) correctColorAndPlace++;
          if (secondResponse == _answer[1]) correctColorAndPlace++;
          if (thirdResponse == _answer[2]) correctColorAndPlace++;
          if (fourtResponse == _answer[3]) correctColorAndPlace++;

          if (correctColorAndPlace == 4) {
            guessed = true;
            break;
          } else {
            for (var answer in _answer) {
              if (firstResponse == answer) correctColorButWrongPlace++;
            }
            for (var answer in _answer) {
              if (secondResponse == answer) correctColorButWrongPlace++;
            }
            for (var answer in _answer) {
              if (thirdResponse == answer) correctColorButWrongPlace++;
            }
            for (var answer in _answer) {
              if (fourtResponse == answer) correctColorButWrongPlace++;
            }
          }

          print("Correct Position: $correctColorAndPlace");
          print("Correct Number: $correctColorButWrongPlace");
          turns++;
        }

        if (guessed) {
          print("YOU GOT THE ANSWER!");
          while (true) {
            print("Please enter your name:");
            String? name = stdin.readLineSync();
            if (name != null && name.isNotEmpty) {
              print("$name, Turns: $turns");
              playerService.addPlayer(name, turns);
              break;
            } else {
              print("Invalid name, try again.");
            }
          }
        } else {
          print("You ran out of turns!");
          print("The answer is $_answer");
        }
        break;

      case "2":
        print("\nThe rulese are simple.");
        print("\n- There is a 4-combination pattern that you must find");
        print(
            "\n- The choices range from 1-8 and you can place them however you like.");
        print("  example: (8, 2, 1, 7)");
        print(
            "\n- The pattern will not contain any duplicates like (8, 8, 1, 2)");
        print(
            "\n- After every incorrect pattern, the mastermind will tell you then number of correct numbers and the number of correct position");
        print(
            "(Note\n no. of correct number means you have these number of correct inputs\n no. correct position mean you have these number of correct inputs in the correct position)");
        print("\n- You will only have 12 Turns to find the correct pattern");
        print("\n- GOOD LUCK!");
        // ignore: unused_local_variable
        String? next = stdin.readLineSync();

        break;

      case "3":
        print("\nLEADERBOARDS");
        playerService.viewPlayers();
        print("\n");
        // ignore: unused_local_variable
        String? next = stdin.readLineSync();
        break;

      case "4":
        running = false;
        break;
    }
  }
}
