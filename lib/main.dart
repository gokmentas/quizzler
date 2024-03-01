import 'package:flutter/material.dart';

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

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Some cats are actually allergic to humans.',
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
    'It is illegal to pee in the Ocean in Portugal.',
    'No piece of square dry paper can be folded in half more than 7 times.',
    'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
    'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
    'The total surface area of two human lungs is approximately 70 square metres.',
    'Google was originally called "Backrub".',
    'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
    'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.'
  ];
  List<bool> answers = [
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    true
  ];
  int questionNumber = 0;

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
                questions[questionNumber],
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
                setState(() {
                  if (questionNumber < questions.length &&
                      scoreKeeper.length < questions.length) {
                    if (answers[questionNumber]) {
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
                    if (questionNumber < questions.length - 1) {
                      questionNumber++;
                    }
                  }
                });
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
                setState(() {
                  if (questionNumber < questions.length &&
                      scoreKeeper.length < questions.length) {
                    if (answers[questionNumber]) {
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
                    if (questionNumber < questions.length - 1) {
                      questionNumber++;
                    }
                  }
                });
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
