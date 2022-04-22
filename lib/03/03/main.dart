import 'package:flutter/material.dart';

void main() {
  runApp(
    const Align(
      child: ColoredBox(
        color: Colors.red,
        child: SizedBox(
          width: 100,
          height: 100,
        ),
      ),
    ),
  );
}
