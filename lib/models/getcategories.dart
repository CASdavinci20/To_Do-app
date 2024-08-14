import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:need_to_do/class/category.dart';




class GetAllCatgories {
  Future<List<CategoryClass>?> gettAllCategories(String userId) async {
    try {
      final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tags?user_id=$userId'); 
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        List<dynamic> responseBody = jsonDecode(response.body);

        if (responseBody is List) {
          if (responseBody.isEmpty) {
            print('No categories found.');
          }
          return responseBody.map((item) => CategoryClass.fromJson(item)).toList();
        } else {
          print('Unexpected JSON format: not a list');
          return null;
        }
      } else {
        print('Failed to load categories: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }



Future<String?> getCategoryId(String userId) async {
  try {
    final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tags?user_id=$userId');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      List<dynamic> responseBody = jsonDecode(response.body);
      return responseBody[0]['tag_id'] as String?;
    } else {
      print('Failed to get Tag Id');
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

}