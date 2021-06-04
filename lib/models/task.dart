import 'package:flutter/material.dart';


class Task {

   String name ;

  bool isDone = false ;

  Task({this.name});


  bool toggledone(){

    isDone = !isDone ;

    return isDone ;
  }



  Task.fromap(Map map) :

    this.name = map['name'] ,
    this.isDone = map['isDone'] ;

  Map toMap(){
    return{
         'name' :this.name ,
      'isDone' : this.isDone,
    } ;

  }


}