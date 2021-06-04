import 'package:flutter/material.dart';




class Tasktile extends StatelessWidget {

  Tasktile({this.ischecked,this.taskTitle,this.checkedstate,this.longpress}) ;

 final String taskTitle ;
 final bool ischecked ;

 final Function checkedstate ;
  final Function longpress ;






  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration:ischecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
     value: ischecked,
    onChanged: checkedstate ,

    ),
      onLongPress: longpress,
    );
  }
}



