import 'package:flutter/material.dart';
import 'package:need_to_do/landingPage.dart';
import 'package:need_to_do/category.dart';
import 'package:need_to_do/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BottomNave {

  

  Widget bottomNave(context) {
    return ClipRRect(
      borderRadius:const BorderRadius.vertical(top: Radius.circular(100)),
  child:   BottomAppBar(
      height: 50,
      color: Colors.white,
      shape:const CircularNotchedRectangle(
      ),
      notchMargin: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon:const Icon(Icons.home_outlined),
            onPressed:() {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                            builder: (context) =>const DashBoardPage(),
                      ),
                  ); 
            },
          ),
          IconButton(
            icon:const Icon(Icons.folder_copy_outlined),
            onPressed: ()async {
              SharedPreferences  prefs = await SharedPreferences.getInstance();
              String? userId = prefs.getString('_id');
              Navigator.push(
                    context,
                    MaterialPageRoute(
                            builder: (context) => BoardPage(userId:userId! ),
                      ),
                  ); 
            },
          ),
          const SizedBox(width: 40), 
          IconButton(
            icon:const Icon(Icons.task_alt_outlined),
            onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //             builder: (context) => TaskPage(),
                //       ),
                //   ); 
            },
          ),
          IconButton(
            icon:const Icon(Icons.person_2_outlined),
            onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                            builder: (context) =>const ProfilePage(),
                      ),
                  ); 
            },
          ),
        ],
      ),
  )
    );
  }

  void showBottomSheet(BuildContext context) {}
}
