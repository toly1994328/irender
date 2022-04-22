import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: PositionedTiles()),
  );
}

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    RandomColorBox(),
    RandomColorBox()
  ];

  void swapTiles() {
    print('====do swapTiles==========');
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }
}

class RandomColorBox extends StatefulWidget {
  final Color color = RandomColor.getColor();

  RandomColorBox({Key? key}) : super(key: key);

  @override
  State<RandomColorBox> createState() => RandomColorBoxState();
}

class RandomColorBoxState extends State<RandomColorBox> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: widget.color,
        child: const SizedBox(
          width: 70,
          height: 70,
        ));
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
