import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/app_data.dart';
import 'package:meth/screens/question_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (_) => AppData(),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: QuestionScreen(),
        );
      },
    );
  }
}
