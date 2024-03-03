import 'package:flutter/material.dart';

import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // TODO : insert this list to the row later
  List<Icon> scoreKeeper = [
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
  ];

  // List<String> questions = [
  //   //   'You can lead a cow down stairs but not up stairs.',
  //   //   'Approximately one quarter of human bones are in the feet.',
  //   //   'A slug\'s blood is green.',
  //   // ];
  //   //
  //   // List<bool> answers = [
  //   //   false,
  //   //   true,
  //   //   true,
  //   // ];
  //   //
  //   // Question q1 =
  //   //     Question('You can lead a cow down stairs but not up stairs.', false);

  List<Question> questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // TODO : add the icon
                // setState(() {
                //   scoreKeeper.add(
                //     Icon(Icons.check, color: Colors.green),
                //   );
                // });

                // TODO : change the index number

                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;

                if (correctAnswer == true) {
                  print('You got it right!');
                } else {
                  print('You got it wrong!');
                }

                setState(() {
                  questionNumber++;
                  if (questionNumber > questionBank.length - 1) {
                    questionNumber = 2;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // TODO : add the icon
                // setState(() {
                //   scoreKeeper.add(
                //     Icon(Icons.close, color: Colors.red),
                //   );
                // });

                // TODO : change the index number

                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;

                if (correctAnswer == false) {
                  print('You got it right!');
                } else {
                  print('You got it wrong!');
                }

                setState(() {
                  questionNumber++;
                  if (questionNumber > questionBank.length - 1) {
                    questionNumber = 2;
                  }
                });
              },
            ),
          ),
        ),
        Row(
          // children: scoreKeeper,
          children: [
            Icon(
              Icons.check,
              color: Colors.green,
            ),
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          ],
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
