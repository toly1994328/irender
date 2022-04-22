import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const ColoredBox(color: Colors.red));
  _delayPrint();
}

void _delayPrint() async{
  await Future.delayed(const Duration(seconds: 2));
  debugDumpLayerTree();
}