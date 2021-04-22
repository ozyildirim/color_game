import 'dart:async';
import 'dart:math';

import 'package:color_game/utils/colors.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  int level;

  GameScreen({required this.level});
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score = 0;
  bool answer = true;
  int second = 60;

  Color requiredColor = Colors.white;
  Color selectedColor = Colors.white;

  @override
  void initState() {
    _timerFunction();
  }

  void changeRequiredColor() {
    requiredColor = (widget.level == 3)
        ? colors3x[pickRandomNumber()]
        : (widget.level == 4)
        ? colors4x[pickRandomNumber()]
        : colors5x[pickRandomNumber()];
  }

  void _timerFunction() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        second--;
      });
      _timerFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Time: " + second.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      "Score: " + score.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: requiredColor,
                      border: Border.all(color: Colors.black87, width: 3)),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: GridView.builder(
                    itemCount: widget.level * widget.level,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.level,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      var boxColor = (widget.level == 3)
                          ? colors3x[pickRandomNumber()]
                          : (widget.level == 4)
                          ? colors4x[pickRandomNumber()]
                          : colors5x[pickRandomNumber()];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (boxColor == requiredColor) {
                              score += 10;
                            } else {
                              score -= 10;
                            }
                          });
                          changeRequiredColor();
                        },
                        child: Container(color: boxColor),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  int pickRandomNumber() {
    var random = new Random();
    return random.nextInt((widget.level * widget.level) - 1);
  }
}
