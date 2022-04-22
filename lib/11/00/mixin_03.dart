main() {
  Human toly = Human();
  toly.run();
  toly.run();
  toly.run();
  toly.inhale();
  toly.run();
  print(toly.count);
}

class Human with CountSystem, RespiratorySystem, MotorSystem {
  Human() {
    initInstances();
  }
}

mixin CountSystem {
  int count = 0;

  void reset() {
    count = 0;
  }

  void plus() {
    count++;
  }
}

mixin RespiratorySystem on CountSystem {
  int oxygenCount = 0;

  initInstances() {
    oxygenCount = 10;
    print('========初始化【呼吸系统】完成====氧气值:$oxygenCount=======');
  }

  inhale() {
    oxygenCount += 10;
    print('========呼吸系统吸入10点氧气值===氧气值:$oxygenCount========');
  }

  void run() {
    plus();
    oxygenCount--;
    print('========呼吸系统正常运行第$count次===氧气值:$oxygenCount======');
  }
}

mixin MotorSystem on RespiratorySystem {
  @override
  initInstances() {
    super.initInstances();
    oxygenCount--;
    print('========初始化【运动系统】完成====氧气值:$oxygenCount=======');
  }

  @override
  void run() {
    if (oxygenCount <= 3) {
      print('========氧气不足，第${count+1}次运动系统无法完成==氧气值:$oxygenCount');
      return;
    }
    super.run();
    oxygenCount -= 3;
    print('========运动系统正常运行第$count次=====氧气值:$oxygenCount=======');
  }
}
