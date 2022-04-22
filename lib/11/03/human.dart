main() {
  Human toly = Human();
  toly.run();
}

class Human with RespiratorySystem, MotorSystem {
  Human() {
    initInstances();
  }
  bool get alive => oxygen > 0;
}

mixin RespiratorySystem {
  int oxygen = 0;
  int _inhaleCount = 0; // 每次吸入的氧气量

  void initInstances({int inhaleCount = 10}) {
    oxygen = 10;
    _inhaleCount = inhaleCount;
    print('========初始化【呼吸系统】完成====氧气值:$oxygen=======');
  }

  void inhale() {
    oxygen += _inhaleCount;
    print('========呼吸系统吸入$_inhaleCount点氧气值===氧气值:$oxygen========');
  }

  void run() {
    oxygen--;
    print('========呼吸系统正常运行===氧气值:$oxygen======');
  }
}

mixin MotorSystem {
  void run() {
    print('========运动系统运行=======');
  }
}
