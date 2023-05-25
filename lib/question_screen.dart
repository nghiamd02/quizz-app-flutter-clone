import 'package:demo1/question_button.dart';
import 'package:flutter/material.dart';
import 'package:demo1/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;

  void nextQuestion(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
      currentIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    return Container(
      margin: const EdgeInsets.all(25),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.title,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.suffleAnswers().map((answer) {
              return QuestionButton(
                answerText: answer,
                onTap: () => nextQuestion(answer),
              );
            })
          ],
        ),
      ),
    );
  }
}
