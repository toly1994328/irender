main() {
  Human toly = Human();
  toly.run();
  toly.run();
  toly.run();
  toly.inhale();
  toly.run();
}

class Human with RespiratorySystem, MotorSystem {
  Human() {
    initInstances();
  }
}

mixin RespiratorySystem {
  int oxygen = 0;

  initInstances() {
    oxygen = 10;
    print('========初始化【呼吸系统】完成====氧气值:$oxygen=======');
  }

  inhale() {
    oxygen += 10;
    print('========吸入 10 点氧气值===氧气值:$oxygen========');

  }

  void run() {
    oxygen--;
    print('========呼吸系统正常运行===氧气值:$oxygen========');
  }
}

mixin MotorSystem on RespiratorySystem {
  @override
  initInstances() {
    super.initInstances();
    oxygen --;
    print('========初始化【运动系统】完成====氧气值:$oxygen=======');
  }

  @override
  void run() {
    if(oxygen<=3){
      print('======氧气不足，运动系统无法运行==氧气值:$oxygen===');
      return;
    }
    super.run();
    oxygen -= 3;
    print('========运动系统正常运行=====氧气值:$oxygen======');
  }
}
