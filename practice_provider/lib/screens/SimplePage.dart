import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimplePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var data=Provider.of<int>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple App"),
      ),
      body:Center(
        child:Text('${data}'),
      )
    );
  }

}