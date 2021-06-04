import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todoey/tasklist.dart';
import 'package:todoey/addtask.dart';
import 'package:provider/provider.dart';
import 'package:todoey/taskdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:todoey/models/task.dart';



class TaskScreen extends StatefulWidget {


  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {


  SharedPreferences sharedPreferences ;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData() ;

  }


  void LoadData() async {
    sharedPreferences = await  SharedPreferences.getInstance();
    List<String> spList = sharedPreferences.getStringList('task');
    Provider.of<TaskData>(context , listen: false).tasks = spList.map((item) =>  Task.fromap(json.decode(item))).toList() ;


  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(

      floatingActionButton: Padding(
        padding: EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed : (){
             showModalBottomSheet(context: context, builder:(context) => Container(
             color: Color(0xFF757575),
            child: AddTask())) ;
          } ,
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
        ),
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          Container(

            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height/20,  left: screenSize.height/20 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  CircleAvatar(
                    radius: screenSize.height/24,
                    backgroundColor: Colors.white,
                    child: Icon( Icons.list,
                    size: screenSize.height/20,
                    ),
                  ),

                  SizedBox(
                    height: screenSize.height/25,
                  ),
                  Text('Todoey',

                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize: screenSize.height/18,
                      color: Colors.white
                    ),
                  ),
                    Text('${Provider.of<TaskData>(context).tasks.length} tasks',

                      style: TextStyle(
                        fontSize: screenSize.height/40,
                          color: Colors.white
                      ),

                  ),

                  SizedBox(
                    height: screenSize.height/24,
                  ),





                ],

              ),
            ),
          ),

            Expanded(
              child: Container(



                  height: screenSize.height/2,
                  width: screenSize.width,
                    padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20) ,),

                      color: Colors.white

                  ),


                child : TaskList(),
              ),
            ),



         ],
        ),
      ),





    );
  }
}

