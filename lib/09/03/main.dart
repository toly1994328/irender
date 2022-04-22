import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_provider.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _red = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: toggle,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
          child: ColorProvider(
        color: _red ? Colors.red : Colors.blue,
        child: const StfA(),
      )),
    );
  }

  void toggle() {
    setState(() {
      _red = !_red;
    });
  }
}

class StfA extends StatefulWidget {
  const StfA({Key? key}) : super(key: key);

  @override
  State<StfA> createState() => _StfAState();
}

//    Color? color =  ColorProvider.maybeOf(context);
//     print(color);
class _StfAState extends State<StfA> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Color? color = ColorProvider.maybeOf(context);
    print(color);
    print('========didChangeDependencies===========');
  }

  @override
  Widget build(BuildContext context) {
    Color? color = ColorProvider.maybeOf(context);
    print('========build===========');
    return Container(
      width: 200,
      height: 200,
      color: color,
    );
  }
}
