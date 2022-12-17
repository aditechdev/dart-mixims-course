import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:meta/meta.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class Animal {
  const Animal();
}

mixin CanRun on Animal {
  int get speed;
  void run() {
    "Running at a speed of $speed".log();
  }
}

class Cat extends Animal with CanRun {
  @override
  // TODO: implement speed
  // int get speed => throw UnimplementedError();
  int speed = 10;
}

// class Dog with CanRun {
//   @override
//   // TODO: implement speed
//   int get speed => throw UnimplementedError();
// }

void testIt() {
  final cat = Cat();
  cat.run();
  cat.speed = 20;
  cat.run();
}
// -------------- STEP 2  --------------------------

mixin CanMakeGetCall {
  String get url;
  @useResult
  Future<String> getString() => getUrl(url).then(
        (resp) => resp
            .transform(
              utf8.decoder,
            )
            .join(),
      );
}

extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) => HttpClient()
      .getUrl(
        Uri.parse(url),
      )
      .then(
        (req) => req.close(),
      );
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
          "<  START CODING / >",
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
