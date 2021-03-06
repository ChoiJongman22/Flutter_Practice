import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:practice_provider/screens/HomePage.dart';
import 'package:practice_provider/screens/counter.dart';
import 'package:provider/provider.dart';
import 'package:practice_provider/screens/Counter.dart';
import 'screens/SimplePage.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>( // Counter 타입 사용. Counter 클래스의 데이터가 변하는지 보고 있다가 변하면 알려줍니다.
      
      child: MaterialApp(
        title: 'Flutter Value',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
