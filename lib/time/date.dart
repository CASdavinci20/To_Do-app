import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerHelper {
  Future<void> selectTime(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2011),
      lastDate: DateTime(2040)
    );
        if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }

  }



 List<Map<String, String>> generateDaysAndDates() {
    List<Map<String, String>> daysAndDates = [];
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1)); 
    for (int i = 0; i < 7; i++) {
      DateTime currentDay = startOfWeek.add(Duration(days: i));
      String dayName = DateFormat('EEE').format(currentDay); 
      String date = DateFormat('d').format(currentDay); 
      daysAndDates.add({'day': dayName, 'date': date});
    }
    return daysAndDates;
  }
  
}
