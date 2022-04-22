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
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _update);
  }

  Color _color = Colors.red;

  void _update() {
    setState(() {
      _color = Colors.blue;
    });
    // setState(() {
    //   _color = Colors.blue;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        key: _globalKey,
        width: 100,
        height: 100,
        child: ColoredBox(color: _color),
      ),
    );
  }
}
