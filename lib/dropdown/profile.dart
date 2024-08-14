import 'package:flutter/material.dart';
import 'package:need_to_do/login.dart';

class ProfileDropdown {
  static PopupMenuButton<int> proilePagePopmenu(BuildContext context) {
    return PopupMenuButton<int>(
      icon:const Icon(Icons.more_vert, color: Colors.white), // Updated icon color
      onSelected: (int result) {
        if (result == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>const LoginPage(),
            ),
          );
        } else if (result == 2) {
        
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: Text('log out'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('edit profile'),
        ),
      ],
    );
  }
}
