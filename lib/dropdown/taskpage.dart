import 'package:flutter/material.dart';
import 'package:need_to_do/update.dart';
import 'package:need_to_do/landingPage.dart';
import 'package:need_to_do/class/task.dart';
import 'package:need_to_do/models/deletetask.dart';





class TaskPopMenu {
  
  static PopupMenuButton<int> taskPagePopmenu(BuildContext context, TaskClass task, Function fetchTask ,Function deleteTask){
    return PopupMenuButton<int>(
      icon: const Icon(Icons.more_vert),
      onSelected: (int result)async {
        if (result == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DashBoardPage(),
            ),
          );
          
        } else if (result == 2) {
        
        } else if (result == 4) {
        final update =  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateTaskPage(task: task),
            ),     
          );
           if(update == true){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Task updated successfully')),
            );
           fetchTask();
          }
        } else if(result == 5) {
          bool confirmed = await _showDeleteConfirmationDialog(context);
          if (confirmed) {
            await deleteTask(task.id);  // Call delete function
            fetchTask();  // Refresh task list after deletion
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Task deleted successfully')),
            );
          }
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: Text(
            'Pending',
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text(
            'Ongoing',
            style: TextStyle(fontSize: 14, color: Colors.yellow),
          ),
        ),
        const PopupMenuItem<int>(
          value: 3,
          child: Text(
            'Completed',
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
        ),
        const PopupMenuItem<int>(
          value: 4,
          child: Text('edit'),
        ),
        const PopupMenuItem<int>(
          value: 5,
          child: Text('delete'),
        ),
      ],
    );
  }
}


   Future<bool> _showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this task?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ) ?? false;
  }
