import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopwatch;

  late Timer t;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var millisec = stopwatch.elapsedMilliseconds;
    String milliSeconds = (millisec % 1000).toString().padLeft(3, "0");
    String seconds =
        ((millisec ~/ 1000) % 60).floor().toString().padLeft(2, "0");
    String minutes =
        ((millisec ~/ (1000 * 60)) % 60).floor().toString().padLeft(2, "0");
    return "$minutes:$seconds:$milliSeconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CupertinoButton(
          onPressed: () {
            handleStartStop();
          },
          padding: EdgeInsets.all(0),
          child: Container(
            height: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xff0395eb), width: 4),
            ),
            child: Text(returnFormattedText(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        CupertinoButton(
            onPressed: () {
              stopwatch.stop();
              stopwatch.reset();
            },
            padding: EdgeInsets.all(0),
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )),
      ])),
    ));
  }
}
