import 'package:flutter/material.dart';
import 'package:need_to_do/card/category.dart';
import 'package:need_to_do/class/category.dart';
import 'package:need_to_do/models/getcategories.dart';
import 'package:need_to_do/bottomnav/dasshboard.dart';
import 'package:need_to_do/functions/bottomNav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:need_to_do/models/gettask.dart';
import 'package:need_to_do/class/task.dart';
import 'package:need_to_do/task.dart';

class BoardPage extends StatefulWidget {
  final String userId;
  const BoardPage( {super.key,required this.userId,});

  @override
  BoardPageState createState() => BoardPageState();
}

class BoardPageState extends State<BoardPage> {
  final CategoryCard categoryCard = CategoryCard();
  final BottomNave bottomNave = BottomNave();
  final BottomNavButton _bottomNaveButton = BottomNavButton();
  List<CategoryClass>? categories;
  List<TaskClass>?  tasks;
  final GetAllTask getAllTasks = GetAllTask();
  final GetAllTask allTask = GetAllTask();
  Map<String, List<TaskClass>> categoryTasks = {};

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }



  void fetchCategories() async {
    final GetAllCatgories getAllCatgories = GetAllCatgories();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('_id');
    print('userIddd:$userId');

    if (userId != null && userId.isNotEmpty) {
      List<CategoryClass>? fetchedCategories = await getAllCatgories.gettAllCategories(userId);
      if (fetchedCategories != null) {
        for (var category in fetchedCategories) {
          List<TaskClass>? tasks = await getAllTasks.getAllTask(category.tagId);
          category.taskCount = tasks?.length ?? 0;
        }
      }
      setState(() {
        categories = fetchedCategories ?? [];
      });
    } else {
      print('User ID not found in SharedPreferences');
      setState(() {
        categories = [];
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: 120),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/avatar.jpg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (categories == null) 
                    const CircularProgressIndicator()
                  else if (categories!.isEmpty)
                   const Text('No categories found.')
                  else 
                   SizedBox(
                      height: 700,
                  child:   GridView.count(
                          primary: false,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(5),
                      children: categories!.map((category) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: categoryCard.categoryCard(
                            icon: const Icon(
                              Icons.folder_copy_outlined,
                              size:25 ,
                              ),
                            title: category.name,
                            total: category.taskCount, 
                            onTap: () {
                           Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TaskPage(categoryId: category.tagId),
                                  ),
                                );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                   )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNave.bottomNave(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bottomNaveButton.showBottomSheet(context);
        },
        backgroundColor: const Color.fromARGB(255, 240, 51, 3),
        foregroundColor: Colors.white,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add_circle_outline_rounded),
      ),
    );
  }
}
