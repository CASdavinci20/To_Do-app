import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:need_to_do/class/task.dart';


class DeleteTask{

  Future <void> deleteTask(String id) async{
    try{
    final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tasks/$id');
    final response = await http.delete(
      url,
       headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );
  print (response);
  print(response.body);

  if (response.statusCode == 200){
    print("Task deleted successfully");

  }else{
    print("Failed to delete task");
  }
    }catch (e){
      print (e);
    }
  }
}
