import 'package:flutter/material.dart';
import 'models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';



class TaskData extends ChangeNotifier{




  SharedPreferences sharedPreferences ;







  void saveData() async{
    List<String> spList = tasks.map((item) => json.encode(item.toMap())).toList() ;
    sharedPreferences = await  SharedPreferences.getInstance();
       sharedPreferences.setStringList('task', spList);
  }


  List<Task> tasks =[

    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ]
  ;



  int get taskcount {

    return tasks.length ;
  }


  void addTask (String newTitle){
    final task = Task(name: newTitle) ;
    tasks.add(task) ;
    notifyListeners() ;
    saveData() ;


  }

void  istrue( Task task){

     task.toggledone() ;
     notifyListeners() ;


  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners() ;
    saveData() ;

  }

}