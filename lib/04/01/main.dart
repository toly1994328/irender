import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    children: const [
      SizedBox(
        width: 60,
        height: 60,
        child: ColoredBox(color: Colors.red),
      ),
      SizedBox(
        width: 40,
        height: 40,
        child: ColoredBox(color: Colors.yellow),
      ),
      SizedBox(
        width: 20,
        height: 20,
        child: ColoredBox(color: Colors.blue),
      ),
    ],
  ));
}
