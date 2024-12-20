import 'dart:math';

import 'package:mastermind_finals/service/models/answer.dart';
import 'package:riverpod/riverpod.dart';

class AnswerService {
  final Ref container;
  static List<Answer> _answers = [];

  AnswerService(this.container);

  void createAnswers() {
    List<int> _pattern = [0, 0, 0, 0];
    int copies = 1;
    int min = 1;
    int max = 8;

    while (copies > 0) {
      copies = 0;
      var rng = Random();

      _pattern[0] = rng.nextInt(max - min + 1) + min;
      _pattern[1] = rng.nextInt(max - min + 1) + min;
      _pattern[2] = rng.nextInt(max - min + 1) + min;
      _pattern[3] = rng.nextInt(max - min + 1) + min;

      for (int pos = 0; pos < _pattern.length - 1; pos++) {
        for (int ind = pos + 1; ind < _pattern.length; ind++) {
          if (_pattern[pos] == _pattern[ind]) {
            copies++;
          }
        }
      }

      var answer = Answer(
        _pattern[0],
        _pattern[1],
        _pattern[2],
        _pattern[3],
      );

      _answers.add(answer);
    }
  }

  void viewAnswer() {
    print(_answers.last);
  }

  Answer assignPattern() {
    return _answers.last;
  }

  List<Answer> get answers => _answers;
}
