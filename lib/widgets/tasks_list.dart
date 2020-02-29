import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            final taskName = taskData.tasks[index].name;
            return Dismissible(
              background: Container(
                // this for left to right swipe
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                //this for right to left swipe
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
              key: Key(taskName),
              onDismissed: (direction) {
                taskData.deleteTask(task);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$taskName was dismissed"),
                  ),
                );
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
