import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // textDirection:TextDirection.ltr,
      children: const [
        SizedBox(
          width: 100,
          height: 100,
          child: ColoredBox(
            color: Colors.blue,
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: ColoredBox(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
