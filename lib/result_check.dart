import 'package:flutter/material.dart';

class ResultCheck extends StatelessWidget {
  const ResultCheck(this.answerData, {super.key});

  final List<Map<String, Object>> answerData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: answerData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(((data['question_index'] as int) + 1).toString()),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question_title'] as String),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(234, 0, 255, 8)),
                      ),
                      Text(
                        data['user_choice'] as String,
                        style: TextStyle(
                            color:
                                (data['user_choice'] == data['correct_answer']
                                    ? const Color.fromARGB(234, 0, 255, 8)
                                    : Colors.red)),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ))
                ],
              );
            }).toList(),
          ),
        ));
  }
}
