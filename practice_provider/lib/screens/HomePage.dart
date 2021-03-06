import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_provider/screens/Counter.dart';
import 'package:practice_provider/screens/FirstPage.dart';
import 'package:practice_provider/screens/SecondPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) :super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              '${counter.getCounter()}',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1
          ),
          ElevatedButton(
            onPressed: openFirstPage,
            child: Text('first page'),
          ),
          ElevatedButton(
            onPressed: openSecondPage,
            child: Text('second page'),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            heroTag: null,),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(onPressed: counter.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            heroTag: null,)
        ],
      ),
    );
  }

  Future openFirstPage() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),

    );
  }

  Future openSecondPage() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),

    );
  }
}

