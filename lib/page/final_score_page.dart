import 'package:flutter/material.dart';

class FinalScorePage extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final List<String> answers;
  final int score;

  FinalScorePage({
    required this.questions,
    required this.answers,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Quiz Completed!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your score is $score out of ${questions.length}'),
          SizedBox(height: 20),
          Text('Answers:'),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                String question = questions[index]['question'] as String;
                String correctAnswer =
                    questions[index]['correctAnswer'] as String;
                String userAnswer =
                    index < answers.length ? answers[index] : 'Not answered';
                bool isCorrect = userAnswer == correctAnswer;

                return ListTile(
                  title: Text(question),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your answer: $userAnswer'),
                      Text(
                        'Correct answer: $correctAnswer',
                        style: TextStyle(
                          color: isCorrect ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Restart'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
