import 'dart:async';

main() {
  print('1=======TAG1=======');
  Foo()..scheduleAttachRootWidget()..scheduleWarmUpFrame();
  print('5=======TAG2=======');
}

class Foo{
  void scheduleAttachRootWidget() {
    Timer.run(() {
      print('2====scheduleAttachRootWidget');
    });
  }

  void scheduleWarmUpFrame() {
    Timer.run(() {
      print('3====scheduleWarmUpFrame do1');
    });

    Timer.run(() {
      print('4====scheduleWarmUpFrame do2');
    });
  }
}

