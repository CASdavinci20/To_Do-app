import 'package:http/http.dart' as http;
import 'dart:convert';

class PostUser{

Future<void> insertUser(String fname, String lname, String email, String password) async {
  try {
    final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/users');
    final String name = '$fname $lname';
    final Map<String, String> payload = {
      "name": name,
      "email": email,
      "password": password
    };
    print('Payload: $payload');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      print('successfully added');
    } else {
      print('Failed to upload');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}


}
