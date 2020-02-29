import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import 'package:todoey_flutter/models/tasks_data.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true, //pops up keyboard when u see textfield
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;

              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                //add our task to the list

                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                // we added listen:false because we dont need to listen to data here, instead we need to that in the tasklist screen
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
