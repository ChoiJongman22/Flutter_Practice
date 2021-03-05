import 'package:flutter/material.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:Text("Well Made")
        ),
        //Scaffold 시작!
        //body:Container(child: Center(child: Text("종만이짱짱!")), //센터로 몰아주는 방법
        body:Container(child: Center(child: Image(image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLfPkbQFKe-zD4aPONtXbS68BBXZjT0xn_6A&usqp=CAU")))),
      ),

    );
  }

  
}