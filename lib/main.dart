import 'package:flutter/material.dart';

import 'calculator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stultus Calculator',
      home: HomePage(title: 'Stultus Calculator'),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 32,
              color: Colors.white70,
            ),
          ),
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 32,
            color: Colors.white70,
          ),
        ),
        scaffoldBackgroundColor: Colors.black54,
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: Calculator(),
    );
  }
}
