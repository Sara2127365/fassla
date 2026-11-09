import 'package:flutter/material.dart';
import 'package:task1fassla/feature/auth/signup/signup_screen.dart';
import 'package:task1fassla/feature/home/home_screen.dart';

void main() {
  runApp(TaskFassla());
}

class TaskFassla
 extends StatelessWidget {
  const TaskFassla
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),);
  }
}