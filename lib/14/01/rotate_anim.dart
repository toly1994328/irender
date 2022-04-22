import 'package:flutter/material.dart';

class RotateAnim extends StatefulWidget {
  const RotateAnim({Key? key}) : super(key: key);

  @override
  State<RotateAnim> createState() => _RotateAnimState();
}

class _RotateAnimState extends State<RotateAnim> with SingleTickerProviderStateMixin{
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _ctrl,
      child: ElevatedButton(
        onPressed: (){
          _ctrl.reset();
          _ctrl.forward();
        },
        child: Text('RUN Anim'),
      ),
    );
  }
}
