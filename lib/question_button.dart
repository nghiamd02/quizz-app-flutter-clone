import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton(
      {super.key, required this.answerText, required this.onTap});
  final void Function() onTap;
  final String answerText;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 66, 16, 74),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: Text(
        answerText,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
