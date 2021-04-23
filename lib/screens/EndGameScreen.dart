import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'LevelScreen.dart';
import 'WelcomeScreen.dart';

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: Colors.amber,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              backwardsCompatibility: false,
            ),
            body: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Score",
                      style: TextStyle(fontSize: 30),
                    ),
                    Container(
                      height: 100,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 70.0,
                          fontFamily: 'Canterbury',
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            ScaleAnimatedText(finalScore.toString())
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LevelScreen()));
                            },
                            child: Text(
                              "Try Again",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: Colors.white,
                            height: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));
                            },
                            child: Text(
                              "Main Menu",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: Colors.white,
                            height: 60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
