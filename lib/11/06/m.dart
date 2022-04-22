// class A with B{ // Error
// class A with C, B { // Error
class A extends D with C, B {
  @override
  void say() {
    print(count);
  }
}

mixin B on D, C {
  int get count => _count;

  void log() => say();
}

mixin C {}

abstract class D {
  int _count = 0;

  void say();
}
