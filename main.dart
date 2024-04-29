import 'package:flutter/material.dart';
import 'Stopwatch.dart';

void main() {
  runApp(StopWatch());
}

class StopWatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
