import 'package:flutter/material.dart';
import 'package:todolist_start/provider/task.dart';
import 'package:provider/provider.dart';
import 'package:todolist_start/widgets/add_new_task.dart';
import 'package:todolist_start/widgets/item_text.dart';

class ListItem extends StatefulWidget {

  final Task task;

  ListItem(this.task);


  @override
  _ListItemState createState() => _ListItemState();

}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    void _checkItem() {
      setState(() {
        Provider.of<TaskProvider>(context, listen: false)
            .changeStatus(widget.task.id);
      });
    }
    return Dismissible(
        key: ValueKey(widget.task.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          Provider.of<TaskProvider>(context, listen: false)
              .removeTask(widget.task.id);
        },
        background: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Delete',
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .errorColor,
                      fontSize: 16
                  ),
                )
              ],
            )
        ),
        child:GestureDetector(
          onTap: _checkItem,
          child: Container(
            height: 65,
            child: Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value:widget.task.isDone,
                        onChanged: (_)=>_checkItem(),
                      ),
                      ItemText(
                        widget.task.isDone,
                        widget.task.desciption,
                        widget.task.dueDate,
                      ),
                    ],
                  ),
                  if(!widget.task.isDone)
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){

                        showModalBottomSheet(context: context,
                        builder: (_)=>AddNewTask(
                          id: widget.task.id,
                          isEditmode: true,
                        ));
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
    );
  }

}