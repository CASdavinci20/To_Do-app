import 'package:flutter/material.dart';
import 'package:need_to_do/card/createtask.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:need_to_do/class/category.dart';
import 'package:need_to_do/models/getcategories.dart';



class CreateTask extends StatefulWidget{
  const CreateTask({super.key});

   @override
  CreateTaskState  createState() => CreateTaskState();
}

class CreateTaskState extends State<CreateTask>{
     final CreateTaskCard  createTask = CreateTaskCard();
     List<CategoryClass>? categories;


    @override
  void initState() {
    super.initState();
    fetchCategories();
  }

   void fetchCategories() async {
    final GetAllCatgories getAllCatgories = GetAllCatgories();

    SharedPreferences prefs =await SharedPreferences.getInstance();
    String? userId = prefs.getString('_id');
    print('userIddd:$userId');

    if (userId != null && userId.isNotEmpty) {
      List<CategoryClass>? fetchedCategories = await getAllCatgories.gettAllCategories(userId);
      setState(() {
        categories = fetchedCategories?? [];
      });
    } else {
      print('User ID not found in SharedPreferences');
      setState(() {
        categories = [];
      });
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
          'Add Task',
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
      child: Padding(
        padding:const EdgeInsets.fromLTRB(0, 100, 0, 0),
     child:  createTask.createTaskCard(context, categories!)
      ),
      ),
      bottomNavigationBar:const BottomAppBar(
        height: 40,
        color: Colors.white,
      ),
    );
  }
}