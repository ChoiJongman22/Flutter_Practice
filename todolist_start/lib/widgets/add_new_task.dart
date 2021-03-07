import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist_start/provider/task.dart';

class AddNewTask extends StatefulWidget {
  final String id;
  final bool isEditmode;

  AddNewTask({
    this.id,
    this.isEditmode,
  });

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  Task task;
  DateTime _selectedDate;
  String _inputDescription;
  final _formKey = GlobalKey<FormState>();

  void _pickUserDueDate() {
    showDatePicker(
      context: context,
      initialDate: widget.isEditmode ? _selectedDate : DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date == null) {
        return;
      }
      date = date;
      setState(() {
        _selectedDate = date;
      });
    });
  }

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (!widget.isEditmode) {
        Provider.of<TaskProvider>(context, listen: false).createNewTask(
          Task(
            id: DateTime.now().toString(),
            desciption: _inputDescription,
            dueDate: _selectedDate,
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    if (widget.isEditmode) {
      task =
          Provider.of<TaskProvider>(context, listen: false).getById(widget.id);
      _selectedDate = task.dueDate;
      _inputDescription = task.desciption;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Title', style: Theme.of(context).textTheme.subtitle1),
        TextFormField(
          initialValue: _inputDescription == null ? null : _inputDescription,
          decoration: InputDecoration(
            hintText: "Describe your task",
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter some text";
            }
            return null;
          },
          onSaved: (value) {
            _inputDescription = value;
          },
        ),
        SizedBox(
          height: 20,
        ),
        Text('Due date', style: Theme.of(context).textTheme.subtitle1),
        TextFormField(
          onTap: () {
            _pickUserDueDate();
          },
          readOnly: true,
          decoration: InputDecoration(
            hintText: _selectedDate == null
                ? 'Provider your due date'
                : DateFormat.yMMMd().format(_selectedDate).toString(),
          ),
        ),
        Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
                child: Text(
                  !widget.isEditmode ? 'Add task' : 'Edit task',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _validateForm();
                }))
      ],
    );
  }
}
