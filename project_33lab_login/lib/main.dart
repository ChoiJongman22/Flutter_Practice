import 'package:flutter/material.dart';
import 'package:project_33lab_login/Screen/login.dart';
import 'package:provider/provider.dart';

void main()=>runApp(Lab33());

class Lab33 extends StatelessWidget{
  //클래스 이름은 숫자 먼저는 안되는구나.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
  //객체 지향 프로그래밍의 특징: 다른 클래스와의 상호 연결

}