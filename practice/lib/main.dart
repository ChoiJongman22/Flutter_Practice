import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              value:true,
              onChanged:(_)=>true,
            ),

          ],
        )
      ],
    );
  }

}


