import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:need_to_do/class/task.dart';





class UpdateTask {
  Future<TaskClass?> updateTask({String? name, String? content, String? id}) async {
    try {
      if (id == null || name == null || content == null) {
        print('Invalid parameters');
        return null;
      }

      final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tasks/$id');
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': name,
          'content': content,
        }),
      );

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody is Map<String, dynamic>) {
          return TaskClass.fromJson(responseBody);
        } else {
          print('Unexpected response format');
          return null;
        }
      } else {
        print('Failed to update task. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
