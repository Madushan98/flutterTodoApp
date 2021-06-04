import 'package:flutter/material.dart';
import 'package:todoey/taskdata.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';



void main() {


  runApp(MyApp());

}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(

      create: (context) => TaskData(),
      child: MaterialApp(

        theme: ThemeData(


          scaffoldBackgroundColor: Colors.lightBlueAccent,



        ),
        debugShowCheckedModeBanner: false,


        home: TaskScreen(),





      ),
    );
  }
}
