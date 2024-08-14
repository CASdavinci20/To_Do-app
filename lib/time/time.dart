import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerHelper {
  Future<void> selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
     if (picked != null) {
    // Convert TimeOfDay to DateTime to use DateFormat
    final now = DateTime.now();
    final selectedTime = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);

    // Use intl to format the time
    final DateFormat timeFormat = DateFormat('HH:mm'); // Change the format as needed
    controller.text = timeFormat.format(selectedTime);
  }
  }


  

}
