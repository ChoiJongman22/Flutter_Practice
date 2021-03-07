import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_start/provider/task.dart';
import 'package:todolist_start/widgets/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=>TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //debug 마크 삭제
        home: HomePage(),
        title:"TodoList",
      ),
    );
  }
}
