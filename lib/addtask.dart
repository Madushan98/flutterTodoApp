import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'taskdata.dart';



class AddTask extends StatefulWidget {




  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String task ;





  @override
  Widget build(BuildContext context) {



    final screenSize = MediaQuery.of(context).size;
    return Container(

      height: screenSize.height,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20) ,topLeft:Radius.circular(20) )
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.height/25),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add Task',

              style: TextStyle(
                fontSize: screenSize.height/25,
                color: Colors.lightBlue,

              ),
            ),
            TextField(


              onChanged: (value){
                setState(() {
                    task = value ;

                });

              },

              textAlign: TextAlign.center,
              autofocus: true,




            ),

             SizedBox(

               height: screenSize.height/25,
             ),
           FlatButton(

              color: Colors.lightBlue,

              child: Center(child: Text('Add',

                style: TextStyle(
                  fontWeight: FontWeight.normal,
                fontSize: screenSize.height/34,
                color: Colors.white,


              ),
              )),

              onPressed: (){

                 Provider.of<TaskData>(context, listen: false).addTask(task);

                 Navigator.pop(context) ;


              },
            ),



          ],



        ),
      ),



    );
  }
}
