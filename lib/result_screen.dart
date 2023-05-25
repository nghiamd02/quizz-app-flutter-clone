import 'package:flutter/material.dart';
import 'package:demo1/data/questions.dart';
import 'package:demo1/result_check.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restart, {super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> get questionsData {
    List<Map<String, Object>> questionData = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      questionData.add({
        'question_index': i,
        'question_title': questions[i].title,
        'correct_answer': questions[i].answers[0],
        'user_choice': chosenAnswers[i]
      });
    }
    return questionData;
  }

  @override
  Widget build(BuildContext context) {
    int totalQuestions = questions.length;
    int correctQuestions = questionsData.where((data) {
      return data['user_choice'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You got $correctQuestions  out of $totalQuestions correct answers',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          ResultCheck(questionsData),
          FilledButton(onPressed: restart , child: const Text('Restart')),
        ],
      ),
    );
  }
}
