import 'package:flutter/material.dart';
import 'score_item.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key? key,
    required this.correct,
    required this.wrong,
    required this.skip,
  }) : super(key: key);

  final int correct;
  final int wrong;
  final int skip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScoreItem(
            correct: correct,
            label: 'Right',
            color: Colors.green,
          ),
        ),
        Expanded(
          child: ScoreItem(
            correct: wrong,
            label: 'Wrong',
            color: Colors.red,
          ),
        ),
        Expanded(
          child: ScoreItem(
            correct: skip,
            label: 'Skipped',
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
