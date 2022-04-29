import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _do,
            child: Text('10 亿次对象创建'),
          ),
          ElevatedButton(
            onPressed: _do2,
            child: Text('10 亿累加计算'),
          ),
        ],
      ),
    );
  }

  void _do() {
    int count = 1000000000;// 10 亿
    int start = DateTime.now().millisecondsSinceEpoch;
    for(int i =0;i<count;i++){
      Point(i, i);
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    print('${((end-start)/1000).toStringAsFixed(4)} s');
  }

  void _do2() {
    int count = 1000000000;// 10 亿
    int start = DateTime.now().millisecondsSinceEpoch;
    int sum = 0;
    for(int i =0;i<count;i++){
      sum+=i;
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    print('${((end-start)/1000).toStringAsFixed(4)} s');
    // print(sum);
  }
}

class Point{
  int x;
  int y;

  Point(this.x, this.y);
}