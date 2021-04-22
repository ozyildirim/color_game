import 'package:color_game/screens/GameScreen.dart';
import 'package:flutter/material.dart';

class LevelScreen extends StatefulWidget {
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose Level",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 70,
                        width: 70,
                        child: FittedBox(
                            child: FloatingActionButton(
                          heroTag: "1",
                          backgroundColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameScreen(
                                          level: 3,
                                        )));
                          },
                          child: Text(
                            "3x3",
                            style: TextStyle(color: Colors.black),
                          ),
                        ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 70,
                        width: 70,
                        child: FittedBox(
                            child: FloatingActionButton(
                          heroTag: "2",
                          backgroundColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameScreen(
                                          level: 4,
                                        )));
                          },
                          child: Text(
                            "4x4",
                            style: TextStyle(color: Colors.black),
                          ),
                        ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 70,
                        width: 70,
                        child: FittedBox(
                            child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameScreen(
                                          level: 5,
                                        )));
                          },
                          child: Text(
                            "5x5",
                            style: TextStyle(color: Colors.black),
                          ),
                        ))),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
