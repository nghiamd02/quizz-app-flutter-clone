import 'package:demo1/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo1/start_screen.dart';
import 'package:demo1/data/questions.dart';
import 'package:demo1/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState extends State<Quiz> {
  List<String> selectedAnswers = [];

  Widget? enableScreen;

  @override
  void initState() {
    enableScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz app demo',
        home: Scaffold(
          backgroundColor: Colors.purple[800],
          body: Center(
            child: enableScreen,
          ),
        ),
        theme: ThemeData(useMaterial3: true));
  }

  void switchScreen() {
    setState(() {
      enableScreen = QuestionScreen(onSelectedAnswer: onSelectedAnswer,);
    });
  }

  void restart(){
    setState(() {
      selectedAnswers = [];
      enableScreen = StartScreen(switchScreen);
    });
  }

  void onSelectedAnswer(String selectedAnswer){
    selectedAnswers.add(selectedAnswer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        enableScreen = ResultScreen(restart, chosenAnswers: selectedAnswers,);
      });
    }
  }
}
