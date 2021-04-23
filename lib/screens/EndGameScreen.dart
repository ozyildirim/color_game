import 'package:flutter/material.dart';

class EndGameScreen extends StatefulWidget {
  final userScore;

  EndGameScreen({this.userScore});

  @override
  _EndGameScreenState createState() => _EndGameScreenState();
}

class _EndGameScreenState extends State<EndGameScreen> {
  int finalScore = 0;

  @override
  void initState() {
    finalScore = widget.userScore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.amber,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              backwardsCompatibility: false,
            ),
            body: Container(
              child: Center(
                child: Text("SCORE: $finalScore"),
              ),
            )));
  }
}
