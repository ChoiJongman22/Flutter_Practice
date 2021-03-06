import 'package:flutter/material.dart';
import 'package:practice_provider/screens/Counter.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
    appBar: AppBar(
    title: Text('Second page'),
    ),
    body: Center(
    child: Container(
    child: Text('Second page counter ${counter.getCounter()}'),
    ),
    ),
    );
  }
}