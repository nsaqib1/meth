import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_data.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        child: Text(
          context.watch<AppData>().questionText,
          style: const TextStyle(fontSize: 34),
        ),
      ),
    );
  }
}
