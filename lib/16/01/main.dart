import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  void initState() {
    super.initState();
    SchedulerBinding.instance!.scheduleFrameCallback((Duration timeStamp) {
      print('===scheduleFrameCallback===帧开始=========');
    });
    // WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
    //   print('===addPostFrameCallback===监听帧=========');
    // });

    SchedulerBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      print('===addPostFrameCallback===监听帧=========');
    });
    SchedulerBinding.instance!.addPersistentFrameCallback((Duration timeStamp) {
      print('===addPersistentFrameCallback===监听帧====${timeStamp}=====');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage1'),),
      body: Center(
        child: ElevatedButton(onPressed: (){},child: Text('PUSH'),),
      ),
    );
  }
}