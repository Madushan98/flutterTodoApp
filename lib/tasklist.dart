import 'package:flutter/material.dart';
import 'tasktile.dart';
import 'taskdata.dart';
import 'package:provider/provider.dart';






class TaskList extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData, child) {

        return ListView.builder(itemBuilder: (context, index) {
          return Tasktile(
            taskTitle:
                taskData.tasks[index].name,
            ischecked:taskData.tasks[index].isDone,
            checkedstate: (value) {
             taskData.istrue(taskData.tasks[index]) ;

//
            },
            longpress: (){
            taskData.deleteTask(taskData.tasks[index]) ;
          },
          );
        },
          itemCount: taskData.taskcount,



        ) ;


      }
    );
  }
}




