main(){
  Human toly =Human();
  toly.run();
}


class Human with RespiratorySystem,MotorSystem{
  Human(){
    initInstances();
  }
}

mixin RespiratorySystem{
  bool initialized = false;

  initInstances(){
    print('========正在初始化呼吸系统===========');
    initialized = true;
  }

  void run(){
    print('========呼吸系统正常运行===========');
  }
}

mixin MotorSystem on RespiratorySystem{
  @override
  initInstances(){
    super.initInstances();
    print('========正在初始化运动系统===========');
  }

  @override
  void run(){
    super.run();
    print('========运动系统正常运行===========');
  }
}