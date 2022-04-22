import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), _update);
  }

  final ValueNotifier<Color> _color = ValueNotifier(Colors.red);
  int _count = 0;

  void _update(Timer timer) {
    if (_count > 10) {
      timer.cancel();
      _count = 0;
      return;
    }
    _color.value =_color.value==Colors.blue?Colors.red: Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        child: SizedBox(
      width: 100,
      height: 100,
      child: ValueListenableBuilder(
        valueListenable: _color,
        builder: (BuildContext context, Color color, Widget? child) =>
            ColoredBox(color: color),
      ),
    ));
  }
}
