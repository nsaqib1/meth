import 'package:flutter/material.dart';
import '../utils/question_generator.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.questionGenerator,
  }) : super(key: key);

  final QuestionGenerator questionGenerator;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        child: Text(
          questionGenerator.questionText,
          style: const TextStyle(fontSize: 34),
        ),
      ),
    );
  }
}
