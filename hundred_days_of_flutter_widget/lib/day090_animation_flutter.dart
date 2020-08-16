import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ! this is the simple App for select the correct animation for the use....

enum Answers {
  useAnimationFarmework,
  useCustomPainter,
  useAnimatedBuilder,
  useSubClassAnimatedWidget,
  useExplicitlyBuiltInFooTransition,
  useTweenAnimationBuilder,
  useImplicityBuiltInAnimationFoo,
  useAnimationDefaultTextStyle,
  stayOnOldSolution
}

class Day90AnimationFlutter extends StatefulWidget {
  Day90AnimationFlutter({Key key}) : super(key: key);

  @override
  _Day90AnimationFlutterState createState() => _Day90AnimationFlutterState();
}

class _Day90AnimationFlutterState extends State<Day90AnimationFlutter> {
  String currentQuestion;
  List<String> questions = [
    'Is my animation is more like a Drawing?',
    'Is my animation is difficult to express in code? Do I want to draw visually?',
    'Am I animating text?',
    'Is my animation goes always forward? There is no repeat!',
    'Am I animating the text Style?',
    'Is there are built-in FooTransition for what I want?',
    'Is there a built-in AnimatedFoo Widget for what I want?',
    'Do I want a standalone animation widget? without any parent widget\'s?',
    'am I having performance problems?',
  ];

  showResultDialog(int result) {
    List<String> results = [
      'Use an animation framework (like Rive)!',
      'Use CustomPainter for explicit animation',
      'Use AnimatedBuilder',
      'Use Subclass AnimatedWidget',
      'Use the Explicitly animated build-in widget, FooTransition',
      'Use TweenAnimationBuilder',
      'Use the implicitly animated built-in widget, AnimatedFoo',
      'Use AnimatedDefaultTextStyle',
      'Stay on the old Solution give by the prevoius question!'
    ];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: 250,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                results[result],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentQuestion = questions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.deepPurple,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Text(
                    currentQuestion,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color: Colors.deepPurple,
                      child: Text(
                        "No",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          if (questions.indexOf(currentQuestion) == 8)
                            showResultDialog(Answers.stayOnOldSolution.index);
                          if (questions.indexOf(currentQuestion) == 7) {
                            showResultDialog(Answers.useAnimatedBuilder.index);
                            currentQuestion = questions[8];
                          }
                          if (questions.indexOf(currentQuestion) == 6)
                            showResultDialog(
                                Answers.useTweenAnimationBuilder.index);
                          if (questions.indexOf(currentQuestion) == 5)
                            currentQuestion = questions[7];
                          if (questions.indexOf(currentQuestion) == 4)
                            showResultDialog(
                                Answers.useAnimationFarmework.index);
                          if (questions.indexOf(currentQuestion) == 3)
                            currentQuestion = questions[5];
                          if (questions.indexOf(currentQuestion) == 2)
                            currentQuestion = questions[3];
                          if (questions.indexOf(currentQuestion) == 1)
                            showResultDialog(Answers.useCustomPainter.index);
                          if (questions.indexOf(currentQuestion) == 0)
                            currentQuestion = questions[2];
                        });
                      },
                    ),
                    RaisedButton(
                      color: Colors.deepPurple,
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print(currentQuestion);
                        setState(() {
                          if (questions.indexOf(currentQuestion) == 8)
                            showResultDialog(Answers.useCustomPainter.index);
                          if (questions.indexOf(currentQuestion) == 7) {
                            showResultDialog(
                                Answers.useSubClassAnimatedWidget.index);
                            currentQuestion = questions[8];
                          }

                          if (questions.indexOf(currentQuestion) == 6)
                            showResultDialog(
                                Answers.useImplicityBuiltInAnimationFoo.index);
                          if (questions.indexOf(currentQuestion) == 5)
                            showResultDialog(Answers
                                .useExplicitlyBuiltInFooTransition.index);
                          if (questions.indexOf(currentQuestion) == 4)
                            showResultDialog(
                                Answers.useAnimationDefaultTextStyle.index);
                          if (questions.indexOf(currentQuestion) == 3)
                            currentQuestion = questions[6];
                          if (questions.indexOf(currentQuestion) == 2)
                            currentQuestion = questions[4];
                          if (questions.indexOf(currentQuestion) == 1)
                            showResultDialog(
                                Answers.useAnimationFarmework.index);
                          if (questions.indexOf(currentQuestion) == 0)
                            currentQuestion = questions[1];
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        currentQuestion = questions[0];
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Select Animation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              const url =
                  'https://github.com/sanjaysanju618/100-Days-Of-Flutter-Widgets/' +
                      'blob/master/hundred_days_of_flutter_widget/' +
                      'lib/day090_animation_flutter.dart';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          )
        ],
      ),
    );
  }
}
