import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:need_to_do/class/task.dart';



class  GetAllTask {
   Future<List<TaskClass>?> getAllTask(String tagId)async{
    
    try{
     final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tags/tasks?tag_id=$tagId');
     final response =await http.get(
      url,
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
     );

     print(response.statusCode);
     print(response.body);
     if(response.statusCode == 200){
      List<dynamic> responseBody = jsonDecode(response.body);
      if(responseBody is List){
        print('Response body type: ${responseBody.runtimeType}');
        print('my respond body: $responseBody');
        return responseBody.map((item) => TaskClass.fromJson(item)).toList();
      }else{
         print('Unexpected JSON format: not a list');
          return null;
      }
     
     }else{
      print('not found');
      return null;
     }
    }catch(e){
      print(e);
      return null;
    }

   }


   

    }




