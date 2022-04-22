

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Human with RespiratorySystem {}

mixin RespiratorySystem {

  int oxygen = 0;

  void inhale() {
    oxygen += 10;
    print('========呼吸系统吸入10点氧气值===氧气值:$oxygen========');
  }

  void run() {
    oxygen--;
    print('========呼吸系统正常运行===氧气值:$oxygen======');
  }
}


class WidgetsFlutterBinding extends BindingBase{
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null)
      WidgetsFlutterBinding();
    return WidgetsBinding.instance!;
  }
}