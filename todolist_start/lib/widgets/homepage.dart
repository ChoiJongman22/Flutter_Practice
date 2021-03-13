import 'package:flutter/material.dart';
import 'package:todolist_start/widgets/add_new_task.dart';
import 'package:todolist_start/widgets/list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showModalBottomSheet(context: context,
                    builder: (_)=>AddNewTask(
                      isEditmode: false,
                    )
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) => AddNewTask(
                    isEditmode: false,
                  ));
        },
        tooltip: '새로운 아이템을 추가합니다.',
      ),
    );
  }
}
