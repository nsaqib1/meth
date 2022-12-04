import 'package:flutter/material.dart';

class MultipleChoiceButton extends StatelessWidget {
  const MultipleChoiceButton({
    super.key,
    required this.answer,
    required this.onPress,
    required this.choice,
  });

  final int answer;
  final int choice;
  final void Function(int a, int b) onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPress(answer, choice),
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 5,
        ),
        child: Text(
          choice.toString(),
          style: const TextStyle(fontSize: 36, color: Colors.blueAccent),
        ),
      ),
    );
  }
}
