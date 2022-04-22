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
      body: Container(
        child:Column(
          children: [
            ElevatedButton(onPressed: (){
              setState(() {

              });
            }, child: Text('RUN')),
            const A(),
          ],
        ),
      ),
    );
  }
}

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {

  @override
  void initState() {
  print('object');
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didUpdateWidget(A oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }
}
