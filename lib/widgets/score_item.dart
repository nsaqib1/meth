import 'package:flutter/material.dart';

class ScoreItem extends StatelessWidget {
  const ScoreItem({
    Key? key,
    required this.correct,
    required this.label,
    required this.color,
  }) : super(key: key);

  final int correct;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '$correct',
              style: TextStyle(
                fontSize: 54,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
