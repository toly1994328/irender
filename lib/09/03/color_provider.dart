import 'package:flutter/material.dart';

class ColorProvider extends InheritedWidget {

  const ColorProvider({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;

  static Color? maybeOf(BuildContext context) {
    final ColorProvider? widget = context.dependOnInheritedWidgetOfExactType<ColorProvider>();
    return widget?.color;
  }

  @override
  bool updateShouldNotify(ColorProvider oldWidget) => color != oldWidget.color;
}