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
        title: Text(title),
      ),
      body: Calculator(),
    );
  }
}
