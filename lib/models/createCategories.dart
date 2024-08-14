import 'dart:convert';
import 'package:http/http.dart' as http;


class CreateTags {
  Future<String?> createCategory(String userId, String name, String color )async{
   try{
    final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tags');
    final response = await http.post(
      url,
      headers:<String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
       body:jsonEncode(<String,String>{
        "user_id": userId,
        "title": name,
        "color": color
  }),  
    );
     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');
     final responseBody = jsonDecode(response.body);
     print(responseBody['title']);
     
     if(responseBody is Map && responseBody.containsKey('id')){
      if(response.statusCode == 200){
        print('sucsessfully created a category');
        print(responseBody);
      }else{
        print('Unexpected JSON format: not a list');
        print('unsuccessful');
      }
      return userId;
      
     }else{
      print('failed:${response.statusCode}');
      return null;
     }

   }catch (e){
     print('error:$e');
      return null;
   }

  }
}