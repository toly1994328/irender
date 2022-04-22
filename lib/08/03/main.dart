import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(PositionedTiles());
}

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    RandomColorBox(key: UniqueKey()),
    RandomColorBox(key: UniqueKey()),
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), swapTiles);
  }

  void swapTiles() {
    print('====do swapTiles==========');
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: tiles);
  }
}

class RandomColorBox extends StatefulWidget {
  const RandomColorBox({Key? key}) : super(key: key);

  @override
  State<RandomColorBox> createState() => RandomColorBoxState();
}

class RandomColorBoxState extends State<RandomColorBox> {
  late Color myColor = Colors.red;
  late String text;

  @override
  void initState() {
    super.initState();
    myColor = RandomColor.getColor();
    print(myColor);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: myColor,
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
