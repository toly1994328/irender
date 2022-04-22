import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr  ,
      child: ColoredBox(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Box(),
            Box(),
          ],
        ),
      ),
    )
  );
  _delayPrint();
}

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
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
            Text('张风捷特烈',style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}


void _delayPrint() async {
  await Future.delayed(const Duration(seconds: 2));
  debugDumpLayerTree();
}
