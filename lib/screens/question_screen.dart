import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_data.dart';
import '../widgets/score_board.dart';
import '../widgets/question.dart';
import '../widgets/multiple_choice_button.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meth'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'Level: ${context.watch<AppData>().level}',
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
            ScoreBoard(),
            const SizedBox(height: 20),
            Question(),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MultipleChoiceButton(
                    answer: context.watch<AppData>().answer,
                    onPress: context.read<AppData>().checkAnswer,
                    choice: context.watch<AppData>().multipleChoice[0],
                  ),
                  const SizedBox(width: 10),
                  MultipleChoiceButton(
                    answer: context.watch<AppData>().answer,
                    onPress: context.watch<AppData>().checkAnswer,
                    choice: context.watch<AppData>().multipleChoice[1],
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
                    answer: context.watch<AppData>().answer,
                    onPress: context.watch<AppData>().checkAnswer,
                    choice: context.watch<AppData>().multipleChoice[2],
                  ),
                  const SizedBox(width: 10),
                  MultipleChoiceButton(
                    answer: context.watch<AppData>().answer,
                    onPress: context.watch<AppData>().checkAnswer,
                    choice: context.watch<AppData>().multipleChoice[3],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: context.read<AppData>().reset,
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
                  onPressed: Provider.of<AppData>(context).skipQuestion,
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
