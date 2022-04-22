import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: ColoredBox(
        color: Colors.red,
        child: SizedBox(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
