import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Widget> tiles = [RandomColorBox(), RandomColorBox()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.sentiment_very_satisfied),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class RandomColorBox extends StatefulWidget {
  const RandomColorBox({Key? key}) : super(key: key);

  @override
  State<RandomColorBox> createState() => RandomColorBoxState();
}

class RandomColorBoxState extends State<RandomColorBox> {
  late Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = RandomColor.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: myColor,
      child: const SizedBox(
        width: 70,
        height: 70,
      ),
    );
  }
}

class RandomColor {
  static final Random _random = Random();

  static Color getColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
  }
}
