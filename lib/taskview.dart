import 'package:flutter/material.dart';



class TaskViewPage extends StatefulWidget{
  const TaskViewPage({super.key});
  @override
  TaskViewState createState()=> TaskViewState();
}

class TaskViewState extends State<TaskViewPage>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  'Task Name:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20,),
                 Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20,),
                 Text(
                  'Status:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
            
            ),
        ],
      ),
    );
  }
}