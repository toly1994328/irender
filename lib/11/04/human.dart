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

mixin MotorSystem on RespiratorySystem{
  int _cost = 0; // 每次消耗的氧气量

  @override
  void initInstances({int count = 3}) {
    super.initInstances();
    _cost = count;
    print('========初始化【运动系统】完成=========');
  }

  @override
  void run() {
    super.run();
    print('========运动系统运行=======');
  }
}

mixin RespiratorySystem {
  int oxygen = 0;
  int _inhaleCount = 0; // 每次吸入的氧气量

  void initInstances({int count = 10}) {
    oxygen = 10;
    _inhaleCount = count;
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




