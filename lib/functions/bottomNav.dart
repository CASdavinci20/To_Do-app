 import 'package:flutter/material.dart';
 import 'package:need_to_do/createtask.dart';
import 'package:need_to_do/createcategory.dart';

class BottomNavButton{
 
void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return  SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title:const Text('Create Task'),
                onTap: () {
                   Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                            builder: (context) =>const CreateTask(),
                      ),
                  ); 
                },
              ),
              ListTile(
                title:const Text('Create Category'),
                onTap: () {
                   Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                            builder: (context) =>const CreateCategory(),
                      ),
                  ); 
                },
              ),
            ],
          ),
        );
      },
    );
  }
}