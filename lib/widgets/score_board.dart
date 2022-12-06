import 'package:flutter/material.dart';
import 'score_item.dart';
import '../data/app_data.dart';
import 'package:provider/provider.dart';

class ScoreBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScoreItem(
            correct: context.watch<AppData>().correct,
            label: 'Right',
            color: Colors.green,
          ),
        ),
        Expanded(
          child: ScoreItem(
            correct: context.watch<AppData>().wrong,
            label: 'Wrong',
            color: Colors.red,
          ),
        ),
        Expanded(
          child: ScoreItem(
            correct: context.watch<AppData>().skip,
            label: 'Skipped',
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
