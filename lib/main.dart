import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

/*

 */
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.green,
              onPressed: () {
                setState(
                  () {
                    if (scoreKeeper.length < 13) {
                      if (quizBrain.getAnswer()) {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }
                    }
                    quizBrain.nextQuestion();
                  },
                );
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                setState(
                  () {
                    if (scoreKeeper.length < 13) {
                      if (quizBrain.getAnswer()) {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      }
                    }
                    quizBrain.nextQuestion();
                  },
                );
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
