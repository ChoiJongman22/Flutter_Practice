import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class Task {
  final String id;
  String desciption;
  DateTime dueDate;
  bool isDone;

  Task({
    //반드시 입력해야하는건 id와 명세
    @required this.id,
    @required this.desciption,
    this.dueDate,
    this.isDone = false, //기본적으로 false
  });
}


class TaskProvider with ChangeNotifier{
  List<Task> get itemsList{
    return _toDoList;
  }
  final List<Task> _toDoList=[
    Task(
      id:"task1",
      desciption: "플러터 공부하기",
      dueDate: DateTime.now(),
    ),
  ];

  Task getById(String id){
    return _toDoList.firstWhere((task) => task.id==id);
  }
  void createNewTask(Task task){
    final newTask=Task( //생성자로 const변수 선언
      id:task.id,
      desciption: task.desciption,
      dueDate: task.dueDate
    );
    _toDoList.add(newTask);
    notifyListeners();
  }
  void editTask(Task task){
    //edit의 개념을 삭제하고 만드는 걸로 함.
    removeTask(task.id);
    createNewTask(task);
  }

  void removeTask(String id){

    _toDoList.removeWhere((task) => task.id==id);
    notifyListeners();
  }

  void changeStatus(String id){
    int index=_toDoList.indexWhere((task) => task.id==id);
    _toDoList[index].isDone=!_toDoList[index].isDone;
  }
}
