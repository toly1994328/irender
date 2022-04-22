import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _animating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: toggle,
        child: _animating
            ? const Icon(Icons.stop)
            : const Icon(Icons.directions_run),
      ),
      body: Center(
          child: CupertinoActivityIndicator(
        color: Colors.red,
        animating: _animating,
        radius: 18,
      )),
    );
  }

  void toggle() {
    setState(() {
      _animating = !_animating;
    });
  }
}
