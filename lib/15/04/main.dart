import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: ColoredBox(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Box(),
          ClipPath(
            clipper:LoveClipper(),
            child: Box(),
          ),
        ],
      ),
    ),
  ));
  _delayPrint();
}

class LoveClipper extends CustomClipper<Path> {
  const LoveClipper();

  @override
  Path getClip(Size size) {
    double fate = 18.5*size.height/100;
    double width = size.width / 2;
    double height = size.height / 4;
    Path path = Path();

    path.moveTo(width, height);
    path.cubicTo(width, height, width + 1.1 * fate, height - 1.5 * fate, width + 2 * fate, height);
    path.cubicTo(width + 2 * fate, height, width + 3.5 * fate, height + 2 * fate, width, height + 4 * fate);

    path.moveTo(width, height);
    path.cubicTo(width, height, width - 1.1 * fate, height - 1.5 * fate, width - 2 * fate, height);
    path.cubicTo(width - 2 * fate, height, width - 3.5 * fate, height + 2 * fate, width, height + 4 * fate);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10,
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset('assets/icon_head.webp'),
          ),
          Text(
            '张风捷特烈',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}

void _delayPrint() async {
  await Future.delayed(const Duration(seconds: 2));
  debugDumpLayerTree();
}
