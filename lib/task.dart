import 'dart:async';
import 'package:flutter/material.dart';
import 'package:need_to_do/bottomnav/dasshboard.dart';
import 'package:need_to_do/createtask.dart';
import 'package:need_to_do/card/task.dart';
import 'package:need_to_do/dropdown/taskpage.dart';
import 'package:need_to_do/functions/day.dart';
import 'package:need_to_do/functions/bottomNav.dart';
import 'package:need_to_do/models/deletetask.dart';
import 'package:need_to_do/time/date.dart';
import 'package:intl/intl.dart';
import 'package:need_to_do/class/task.dart';
import 'package:need_to_do/models/gettask.dart';





class TaskPage extends StatefulWidget {
  final String categoryId;
  const TaskPage({super.key,required this.categoryId,});


  @override
  TaskPageState createState() => TaskPageState(); 
}

class TaskPageState extends State<TaskPage>{
  final BottomNave bottomNave = BottomNave();
  final TaskCard taskCard = TaskCard();
  final DayOfWeek  dayName = DayOfWeek();
  final BottomNavButton _bottomNavButton = BottomNavButton();
  final DatePickerHelper datePickerHelper = DatePickerHelper();
   String dateNow ='';
   String dayNow = '';
   List<TaskClass>?  tasks;
   bool isLoading = true;
   


 @override
  void initState() {
    super.initState();
    timeNow();
  // setState(() {
       fetchTask();
  //  });
    
  }
 
  
  void timeNow(){
    DateTime now = DateTime.now();
    String  dateFormat = DateFormat('MM - dd - yyyy').format(now);
    String dayOfWeek = dayName.getDayName(now.weekday);
      setState(() {
      dateNow = dateFormat;
      dayNow = dayOfWeek;
    });
  }
 
 

  Future<void> fetchTask() async {
    setState(() {
      isLoading = true; 
    });
    try {
      late GetAllTask allTask = GetAllTask();
      List<TaskClass>? fetchedTasks = await allTask.getAllTask(widget.categoryId);
      setState(() {
        tasks = fetchedTasks ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        tasks = [];
        isLoading = false; 
      });
    }
  }

  Future<void> deleteTask(String taskId) async {
    final deleteTaskService = DeleteTask();
    await deleteTaskService.deleteTask(taskId);
  }


  @override
  Widget build(BuildContext context){
  List<Map<String, String>> daysAndDates = datePickerHelper.generateDaysAndDates();
  String currentDay = DateFormat('EEE').format(DateTime.now());
    return Scaffold(
      backgroundColor:const Color(0xffdddcdf),
      body: Column(
        children: [
              const Padding(
                padding:EdgeInsets.all(20),
                child: Row(
                  children: [
               Row(
                  children: [
                Text(
                  'Task',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800
                  ),
                ),
                 SizedBox(width: 200),
              CircleAvatar(
                radius: 30,
              backgroundImage: AssetImage(
                 'assets/avatar.jpg',
                ),
              )
                  ]
                ), 
        ]
            ),
               ),
               Row(
                children: [
                  Padding(
                    padding:const EdgeInsets.all(20),
                    child: Row(
                      children: [
                         Column(
                          children: [
                            Text(
                              dateNow,
                              style:const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                              ),
                            const SizedBox(height: 4,),
                            Text(
                              dayNow,
                              style:const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.black
                              ),
                              )    
                          ],
                        ),
                       const SizedBox(width: 120,),
                        ElevatedButton(
                          onPressed: (){
                              Navigator.push(
                                 context,
                               MaterialPageRoute(
                            builder: (context) => const CreateTask(),
                               )
                      );
                  
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:const Color.fromARGB(255, 240, 51, 3),
                            padding:const EdgeInsets.symmetric(vertical:10, horizontal:20  ),
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ) 
                          ), 
                          child:const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(width: 2,),
                              Text(
                               'Add Task',
                               style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.white
                               ),
                              )
                            ],
                            )
                          )
                      ],
                    ),
                  )
                ],
               ), 
               Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: daysAndDates.map((dayAndDate) {
      bool isCurrentDay = dayAndDate['day'] == currentDay;
      return Column(
     mainAxisAlignment: MainAxisAlignment.center,
         children: [
            Text(
              dayAndDate['day']!,
              style:TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
              color: isCurrentDay ? Colors.purple : Colors.black,
              ),
            ),
            Text(
              dayAndDate['date']!,
              style: TextStyle(
                fontSize: 10,
                color: isCurrentDay ? Colors.purple : Colors.black,
              ),
              
            ),
          ],
        );
      }).toList(),
    ),

      const Divider(
                color: Colors.grey,
                height: 2,
               ),
               if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (tasks!.isEmpty)
            const Center(child: Text('No task found.'))
                  else 
               Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 1,
                padding: const EdgeInsets.all(5),
                children: tasks!.map((task) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: taskCard.taskCard(
                      color: Colors.orange,
                      mode: 'Running',
                      title: task.name,
                      description: task.content,
                      timeIcon: const Icon(Icons.access_time_outlined),
                      people: 4,
                      persoIcon: const Icon(Icons.people_alt_outlined),
                      titleIcon: TaskPopMenu.taskPagePopmenu(context,task,fetchTask,deleteTask),
                      onTap: () {
                       
                      },
                    ),
                  );
                      }).toList(),
                    ),
               )
               )
        ]
      ),
       bottomNavigationBar: bottomNave.bottomNave(context),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: FloatingActionButton(
        onPressed: () { 
          _bottomNavButton.showBottomSheet(context);
        },
        backgroundColor:const Color.fromARGB(255, 240, 51, 3),
        foregroundColor: Colors.white, 
        elevation: 4.0, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), 
        ),
       child:const Icon(  
          Icons.add_circle_outline_rounded),
      ),
    );
  }
}

