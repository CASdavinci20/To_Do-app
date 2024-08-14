import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:need_to_do/class/category.dart';

class UpdateTags {
  Future<CategoryClass?> updateTags({String? name, String? color, String? id})async{
    try{
       if (id == null || name == null || color == null) {
        print('Invalid parameters');
        return null;
      }
      final url = Uri.parse('http://todo.reworkstaging.name.ng/v1/tags/$id');
      final response = await http.put(
        url,
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode(<String,String>{
          'title':name,
          'color':color
        })
      );

      print(response);
      print(response.statusCode);

      if(response.statusCode == 200){
        final responseBody = jsonDecode(response.body);
        if(responseBody is Map<String,dynamic>){
          return CategoryClass.fromJson(responseBody);   
        }else{
          print('failed to update tag');
          return null;
        }
      }else{
        print('response not found');
        return null;
      }

    }catch(e){
      print (e);
      return null;
    }

  }
}