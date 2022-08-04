import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TouchGrass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageTheme(),
    );
  }
}

class PageTheme extends StatelessWidget {
  const PageTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: QuestPage());
  }
}

class QuestPage extends StatelessWidget {
  const QuestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(child: QuestWidget());
  }
}

class QuestWidget extends StatefulWidget {
  const QuestWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuestWidget();
}

class _QuestWidget extends State<QuestWidget> {
  String prompt = taskPrompts();
  updateTask() {
    setState(() {
      prompt = taskPrompts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: MediaQuery.of(context).size.height,
      child: Text(
        prompt,
        style: TextStyle(fontSize: MediaQuery.of(context).size.height / 20),
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        updateTask();
      },
    );
  }
}

String taskPrompts() {
  List<String> subjects = [
    'day of school',
    'thing you\'d do if you had a million dollars',
    'friend you made',
    'thing you did this morning',
  ];
  List<String> scenario = [
    'you forgot to bring money while out shopping',
    'you had a dog',
    'your student loans were forgiven',
    'your crush texted you',
    'a car crashed into your living room',
    'an alien ship whisked you off to mars',
    'you timed travel into the ${Random().nextInt(6) + 13}th century',
    'something went on sale the second after you bought it',
    'lost in a foreign country where you couldn\'t speak the local language',
  ];
  List<String> favorites = [
    'food',
    'movie',
    'tv-show',
    'character',
    'form of media',
    'place of calmness',
    'hiking spot',
    'restruant',
    'hobbies',
    'subject at school',
    'color and why it is',
    'thing to do',
    'genre of books',
  ];
  List<String> ratherChoices = [
    'confess your undying feelings',
    'convert to pastafarian',
    'get an F on a test',
    'give a speech on a subject you know nothing about',
    'have your shower debates leaked',
    'accidentally slip on the floor',
    'have your parents find out about your guilty pleasures (e.g. late night movie binge)',
    'have your bank account empty',
    'have lost your keys',
    'get knocked out by a golfball'
  ];
  List<String> task = [
    'Say thank you and why',
    'A secret',
    'A joke',
    'An embarassing moment',
    'What you\'d change about yourself',
    'A time when you were forced to do something you didn\'t want to do but actually enjoyed it',
    'Something good that happened',
    'A hope you have for the future',
    'The latest obsession you\'ve gotten into',
    'What you\'d do differently if you could go back in time',
    'Something you noticed about them (Positive things only)',
    'Go on Reddit and read out the first post you see',
    'About your favorite ${favorites[Random().nextInt(favorites.length)]}',
    'How much you appreciate them',
    'About the first ${subjects[Random().nextInt(subjects.length)]}',
    'What you\'d do if ${scenario[Random().nextInt(scenario.length)]}',
    'List ten things you\'d put on your bucketlist to do before you die',
    'Ask about what songs they listen to',
    'Show a childhood photo',
    'A place you would want to visit',
    'Would you rather: ${ratherChoices[Random().nextInt(ratherChoices.length)]} or ${ratherChoices[Random().nextInt(ratherChoices.length)]}?',
    'Who is your role model?',
    'An inspiring moment of your life',
    'A time when your expectations were completely wrong'
  ];
  return task[Random().nextInt(task.length)];
}
