import 'package:flutter/material.dart';





class CategoryClass {
  final String tagId;
  final String userId;
  final String name;
  final Color color;
  int taskCount;

  CategoryClass({
    required this.tagId,
    required this.userId,
    required this.name,
    required this.color,
    required this.taskCount
  });

  factory CategoryClass.fromJson(Map<String, dynamic> json) {
    String tagId = json['id'] ?? 'notfound';
    String userId = json['user_id'] ?? 'unknown';
    String name = json['title'] ?? 'No Name';
    String colorString = json['color'] ?? '#000000';
    int taskCount = json["task"] ?? 'non'; 

  
    Color color;
    try {
      color = Color(int.parse(colorString.replaceFirst('#', '0xff')));
    } catch (e) {
      print('Invalid color value: $colorString, defaulting to black');
      color = Color(0xff000000); 
    }

    return CategoryClass(
       tagId: tagId,
      userId: userId,
      name: name,
      color: color,
      taskCount: taskCount

    );
  }
}