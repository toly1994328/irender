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
  Widget build(BuildContext context) {
    return const Align(
      child:  SizedBox(
          width: 100,
          height: 100,
          child: ColoredBox(
            color: Colors.red,
        ),
      ),
    );
  }
}
