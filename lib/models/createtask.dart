import 'dart:convert';
import 'package:http/http.dart' as http;



class CreateTask{

  Future<String?> createTask({String? name,String? content, String? tagId})async{

    Map data = {     
            'tag_id':tagId,
            'title':name,
            'content':content
           };
      print('the data:$data');
  try{
    final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tasks');
    final response = await http.post(
      url,
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:jsonEncode( <String,String>{
            'tag_id':tagId!,
            'title':name!,
            'content':content!
      })
    );

    print(response.body);
    print(response.statusCode);
    final responseBody = jsonDecode(response.body);
     print("this is the body:$responseBody");

      if(response.statusCode == 200 && responseBody is Map && responseBody.containsKey('id')){ 
        print('sucsessfully created a task');
        print('the tag is all:$tagId');
          return tagId;
          
      }else{
        print('Unexpected JSON format: not a list');
        print('unsuccessful');
      }
      return null;

   }catch (e){
      print(e);
     return null;
   }
}
}