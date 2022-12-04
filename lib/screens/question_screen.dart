import 'package:flutter/material.dart';
import 'package:meth/utils/question_generator.dart';
import '../widgets/score_board.dart';
import '../widgets/question.dart';
import '../widgets/multiple_choice_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int correct = 0;
  int wrong = 0;
  int skip = 0;

  int level = 1;
  int hitPoint = 10;

  void skipQuestion() {
    if ((wrong + skip) == hitPoint - 1) {
      setState(() {
        level -= 1;
        correct = 0;
        wrong = 0;
        skip = 0;
      });
      return;
    }

    if ((wrong + skip) < hitPoint - 1) {
      setState(() {
        skip += 1;
      });
      return;
    }
  }

  void checkAnswer(int answer, int choosed) {
    if (answer == choosed && correct == hitPoint - 1) {
      setState(() {
        level += 1;
        correct = 0;
        wrong = 0;
        skip = 0;
      });
      return;
    }

    if (answer == choosed && correct < hitPoint - 1) {
      setState(() {
        correct += 1;
      });
      return;
    }

    if (answer != choosed && (wrong + skip) == hitPoint - 1) {
      setState(() {
        level -= 1;
        correct = 0;
        wrong = 0;
        skip = 0;
      });
      return;
    }

    if (answer != choosed && (wrong + skip) < hitPoint - 1) {
      setState(() {
        wrong += 1;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    QuestionGenerator questionGenerator = QuestionGenerator();
    questionGenerator.generateQuestion();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meth'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'Level: $level',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              ' Hit Point 10',
              style: TextStyle(fontSize: 18),
            ),
            ScoreBoard(correct: correct, wrong: wrong, skip: skip),
            const SizedBox(height: 20),
            Question(questionGenerator: questionGenerator),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MultipleChoiceButton(
                    answer: questionGenerator.answer,
                    onPress: checkAnswer,
                    choice: questionGenerator.multipleChoice[0],
                  ),
                  const SizedBox(width: 10),
                  MultipleChoiceButton(
                    answer: questionGenerator.answer,
                    onPress: checkAnswer,
                    choice: questionGenerator.multipleChoice[1],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MultipleChoiceButton(
                    answer: questionGenerator.answer,
                    onPress: checkAnswer,
                    choice: questionGenerator.multipleChoice[2],
                  ),
                  const SizedBox(width: 10),
                  MultipleChoiceButton(
                    answer: questionGenerator.answer,
                    onPress: checkAnswer,
                    choice: questionGenerator.multipleChoice[3],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      correct = 0;
                      wrong = 0;
                      skip = 0;
                      level = 0;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: skipQuestion,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
