import 'package:http/http.dart' as http;
import 'dart:convert';


class Authenthicate {

  Future<String?> authenticateUsers(String email,String password) async{
     try {
    final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/users/login');
     final response = await http.post(
      url,
      headers:<String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
       body:jsonEncode(<String,String>{
      "email": email,
      "password": password,
  }),
    );
       
       print('Response status: ${response.statusCode}');
       print('Response body: ${response.body}');
        final responseBody = jsonDecode(response.body);
        

    if (responseBody is Map && responseBody.containsKey('id')){
      print(responseBody);
      return responseBody['id'];
    }else{ 
      print('Failed to login: ${response.body}');
      print('unknown login details');
    return null;
    }
   
     }catch (e){
      print(e);
      return null;
     }


  }
}
