import 'package:flutter/material.dart';
import 'package:need_to_do/card/category.dart';
import 'package:need_to_do/time/time.dart';
import 'package:need_to_do/time/date.dart';
import 'package:need_to_do/class/category.dart';
import 'package:need_to_do/models/createtask.dart';
import 'package:need_to_do/models/updatetask.dart';



class CreateTaskCard {



     final CategoryCard  categoryCard = CategoryCard();
     final UpdateTask updatetask =UpdateTask();
     final CreateTask    createTask= CreateTask();
     final TimePickerHelper _timePickerHelper = TimePickerHelper();
     final DatePickerHelper _datePickerHelper = DatePickerHelper();
     String? selectTagId;
     

     
     final TextEditingController _startTimeController = TextEditingController();
     final TextEditingController _endTimeController = TextEditingController();
     final TextEditingController _dateTimeController = TextEditingController();
     final TextEditingController _nameController = TextEditingController();
     final TextEditingController _contentController = TextEditingController();
     


     


  Widget  createTaskCard( BuildContext context, List<CategoryClass>categories){
    

  return Card(
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
       SingleChildScrollView(
        scrollDirection: Axis.horizontal,
      child: Row(
                      children: categories
                          .map((category) => GestureDetector(
                       
                       onTap:(){
                        print("this is the tag:${category.tagId}");
                             selectTagId = category.tagId;
                       },
                      child:  categoryCard.categoryDisplayCard(
                          color: selectTagId == category.tagId
                              ? Colors.orange
                              : Colors.green,
                          name: category.name,
                      
                        ))
                      )
                          .toList(),
                    ),
       ),
      const SizedBox(height: 50,),
        ElevatedButton(
                      onPressed: () async {
                        String? tagId = selectTagId;
                        String name = _nameController.text;
                        String content = _contentController.text;

                        if (tagId == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a category'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        try {
                          var response = await createTask.createTask(
                              tagId: tagId, name: name, content: content);
                          if (response != null && response.isNotEmpty) {
                            print('Task created with tagId: $tagId');
                            print(response);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Successfully created'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }else if (response is List ){
                            var updatedReponse = await updatetask.updateTask(
                              name: name,
                              content: content
                            );
                            print(updatedReponse);
                          } else {
                            print('Failed to create task with tagId: $tagId');
                            print(response);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to create'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        } catch (e) {
                          print('Error occurred: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: $e'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
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
  );
  }
  
}