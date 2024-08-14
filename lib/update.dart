import 'package:flutter/material.dart';
import 'package:need_to_do/card/category.dart';
import 'package:need_to_do/models/gettask.dart';
import 'package:need_to_do/time/time.dart';
import 'package:need_to_do/time/date.dart';
import 'package:need_to_do/class/task.dart';
import 'package:need_to_do/models/createtask.dart';
import 'package:need_to_do/models/updatetask.dart';



class UpdateTaskPage extends StatefulWidget {
  final TaskClass task;

  const UpdateTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  _UpdateTaskPageState createState() => _UpdateTaskPageState();
}

class _UpdateTaskPageState extends State<UpdateTaskPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
 
  
     final CategoryCard  categoryCard = CategoryCard();
     late UpdateTask updateTask =UpdateTask();
     final CreateTask    createTask= CreateTask();
     final GetAllTask tasks = GetAllTask();
     final TimePickerHelper _timePickerHelper = TimePickerHelper();
     final DatePickerHelper _datePickerHelper = DatePickerHelper();
     String? selectTaskId;
     

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.task.name;
    _contentController.text = widget.task.content;
  }


  @override
   void dispose (){
    _nameController.dispose();
    _contentController.dispose();
    super.dispose();
  }


  Future<void> _updateTaskAction() async {
  try {
    final updatedTask = await updateTask.updateTask(
      id: widget.task.id,
      name: _nameController.text,
      content: _contentController.text,
    );

    if (updatedTask != null) {
      Navigator.pop(
        context,true
      
        );
    
    } else {
      print('Unexpected response format or failed to update task');
    }
  } catch (e) {

    print('Failed to update task: $e');
  }
}


  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      backgroundColor:const Color.fromARGB(255, 48, 38, 122),
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.transparent,
        title:  Row(
          children: [
            IconButton(
            icon:const Icon( Icons.arrow_back_ios,
              color: Colors.white,
            ),
          onPressed: () {
            Navigator.pop(context);
          },
            ),
          const  SizedBox(width: 20,),
        const Text(
          'Edit Task',
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ) ,
        ),
          ]
      ),
      
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
     child:  Card(
     elevation: 10.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
    ),
  child: SizedBox(
    height: 600,
    width: 370,
    child: Column(
      children: [
        Padding(padding:const EdgeInsets.fromLTRB(20, 40,20,0),
        child: Column(
          children: [
        SizedBox(
          height: 45,
          width: 300,
          child: TextField(
            controller: _nameController,
            style:const TextStyle(
            height: 1,
            fontSize: 13,
          ),
            decoration:  InputDecoration(
              labelText: 'Task Name',
              labelStyle:const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 30,),
        SizedBox(
          height: 45,
          width: 300,
          child: TextField(
           controller:  _dateTimeController,
          style:const TextStyle(
            height: 1,
            fontSize: 13,
          ),
            decoration:  InputDecoration(
              labelText: 'Date',
              labelStyle:const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 13),
               suffixIcon: IconButton(
             icon:const Icon(Icons.calendar_month_outlined),
             onPressed: () {
                    _datePickerHelper.selectTime(context, _dateTimeController);
                  },
              )
            ),
          ),
        ),
        const SizedBox(height: 30,),
        Row(
          children: [
            SizedBox(
          height: 45,
          width: 141,
          child: TextField(
             controller:   _startTimeController,
             style:const TextStyle(
            height: 1,
            fontSize: 13,
          ),
            decoration:  InputDecoration(
              labelText: 'Start Time',
              labelStyle:const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 13),
              suffixIcon: IconButton(
             icon:const Icon(Icons.arrow_drop_down),
             iconSize: 25,
             onPressed: () {
                    _timePickerHelper.selectTime(context, _startTimeController);
                  },
              )
            ),
          ),
        ),
       const SizedBox(width: 20,),
       SizedBox(
          height: 45,
          width: 141,
          child: TextField(
            controller: _endTimeController,
            style:const TextStyle(
            height: 1,
            fontSize: 13,
          ),
            decoration:  InputDecoration(
              labelText: 'End Time',
              labelStyle:const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 13),
              suffixIcon: IconButton(
             icon:const Icon(Icons.arrow_drop_down),
             iconSize: 25,
             onPressed: () {
                    _timePickerHelper.selectTime(context, _endTimeController);
                  },
              )
            ),
          ),
        )
          ],
        ),
        const SizedBox(height: 30,),
        SizedBox(
          height: 45,
          width: 300,
          child: TextField(
            controller: _contentController,
            style:const TextStyle(
            height: 1,
            fontSize: 13,
          ),
            decoration:  InputDecoration(
              labelText: 'Description',
              labelStyle:const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 13),
            ),
           
          ),
        ),
       const SizedBox(height: 40,),
     
      const SizedBox(height: 50,),
        ElevatedButton(
                      onPressed: () async {
                        _updateTaskAction(); 
                       
                      },
          style: ElevatedButton.styleFrom(
            backgroundColor:const Color.fromARGB(255, 48, 38, 122),
            padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 130),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          child:const Text(
            'Done',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white
            ),
          )
          )
          ]
        )
        )
      ],
    ),
  ),
  ),
      ),
      
      bottomNavigationBar:const BottomAppBar(
        height: 40,
        color: Colors.white,
      ),
    );
  }
}
