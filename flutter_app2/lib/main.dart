import 'package:flutter/material.dart';
import 'package:flutter_app2/Screens/login.dart';

void main() => runApp(MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AuthPage());
  }
}
