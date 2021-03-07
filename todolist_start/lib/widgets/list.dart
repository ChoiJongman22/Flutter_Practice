import 'package:flutter/material.dart';
import 'package:todolist_start/provider/task.dart';
import 'package:provider/provider.dart';
import 'package:todolist_start/widgets/list_item.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider
        .of<TaskProvider>(context)
        .itemsList;
    return taskList.length > 0
        ? ListView.builder(itemCount: taskList.length,
      itemBuilder: (context, index) {
        return ListItem(taskList[index]);
      },)
        : LayoutBuilder(
      builder: (ctx, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100, color: Colors.yellow,
              ),
              SizedBox(
                height: 30,
              ),
              Text("아직 할일이 없어요!",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,)
            ],
          ),
        );
      },);
  }

}