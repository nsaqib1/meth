import 'dart:math';

class QuestionGenerator {
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
  }

  generateQuestion() {
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
  }
}
