import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.switchScreen, {
    super.key,
  });

  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(181, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Flutter the fun way',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        FilledButton.icon(
          onPressed: switchScreen,
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
