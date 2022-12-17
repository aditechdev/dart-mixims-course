import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

mixin canRun {
  int get speed;
  void run() {
    "Running at a speed of $speed".log();
  }
}

class Cat with canRun {
  @override
  // TODO: implement speed
  // int get speed => throw UnimplementedError();
  int speed = 10;
}

void testIt() {
  final cat = Cat();
  cat.run();
  cat.speed = 20;
  cat.run();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    testIt();
    return const Scaffold(
      body: Center(
        child: Text(
          "START CODING\n\n</>",
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
