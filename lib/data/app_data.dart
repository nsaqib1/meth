import 'package:flutter/foundation.dart';
import 'dart:math';

class AppData extends ChangeNotifier {
  int correct = 0;
  int wrong = 0;
  int skip = 0;

  int level = 1;
  int hitPoint = 10;

  void reset() {
    correct = 0;
    wrong = 0;
    skip = 0;
    level = 0;
    notifyListeners();
  }

  void skipQuestion() {
    if ((wrong + skip) == hitPoint - 1) {
      level -= 1;
      correct = 0;
      wrong = 0;
      skip = 0;
      notifyListeners();
      return;
    }

    if ((wrong + skip) < hitPoint - 1) {
      skip += 1;
      notifyListeners();
      return;
    }
  }

  void checkAnswer(int answer, int choosed) {
    if (answer == choosed && correct == hitPoint - 1) {
      level += 1;
      correct = 0;
      wrong = 0;
      skip = 0;
      notifyListeners();
      return;
    }

    if (answer == choosed && correct < hitPoint - 1) {
      correct += 1;
      notifyListeners();
      return;
    }

    if (answer != choosed && (wrong + skip) == hitPoint - 1) {
      level -= 1;
      correct = 0;
      wrong = 0;
      skip = 0;
      notifyListeners();
      return;
    }

    if (answer != choosed && (wrong + skip) < hitPoint - 1) {
      wrong += 1;
      notifyListeners();
      return;
    }
  }

  String _questionText = '';
  int _answer = 0;
  List<int> _multipleChoice = [];

  get questionText => _questionText;
  get answer => _answer;
  List<int> get multipleChoice => _multipleChoice;

  multipleChoiceMaker() {
    _multipleChoice = [
      _answer,
      _answer + (Random().nextInt(10) + 1),
      _answer - (Random().nextInt(10) + 1),
      _answer + (Random().nextInt(10) + 1),
    ];
    _multipleChoice.shuffle();
    notifyListeners();
  }

  AppData() {
    int firstNumber = Random().nextInt(100);
    int secondNumber = Random().nextInt(100);

    int operator = Random().nextInt(3);
    switch (operator) {
      case 0:
        _questionText = '$firstNumber + $secondNumber = ?';
        _answer = firstNumber + secondNumber;
        multipleChoiceMaker();
        break;
      case 1:
        _questionText = '$firstNumber - $secondNumber = ?';
        _answer = firstNumber - secondNumber;
        multipleChoiceMaker();
        break;
      case 2:
        _questionText = '$firstNumber x $secondNumber = ?';
        _answer = firstNumber * secondNumber;
        multipleChoiceMaker();
        break;
    }
    notifyListeners();
  }
}
