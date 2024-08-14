 import'package:flutter/material.dart';
 
 Color getColorFromString(String color) {
    switch (color.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'orange':
         return Colors.orange;  
      default:
        return Colors.black;
    }
  }