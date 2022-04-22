import 'dart:async';

main(){
  print('1=======TAG1=======');
  Timer.run(() {
    print('2====Timer.run====');
  });
  print('3=======TAG2=======');
}

