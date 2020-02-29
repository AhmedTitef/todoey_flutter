import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    // we made it private to be no longer acessible from outside and npt to be able to use ._task.add by mistake
  ];

  UnmodifiableListView<Task> get tasks {
    //thats like a getter for _task but safer
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    //this to update the checkbox by passing boolean true or false

    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
