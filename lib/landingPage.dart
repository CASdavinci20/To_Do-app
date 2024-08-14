import 'package:flutter/material.dart';
import 'package:need_to_do/chart/chart.dart';
import 'package:need_to_do/card/dashboard.dart';
import 'package:need_to_do/bottomnav/dasshboard.dart';
import 'package:need_to_do/functions/bottomNav.dart';
import 'package:need_to_do/class/category.dart';




class DashBoardPage extends StatefulWidget {
  final List<CategoryClass>? categories;

  const DashBoardPage({super.key, this.categories});


  @override
  DashBoardState createState() => DashBoardState(); 
}

class DashBoardState extends State<DashBoardPage>{
  final MyPieChart pieChart = MyPieChart();
  final DashboardBuilder taskCard = DashboardBuilder();
  final BottomNave bottomNave = BottomNave();
  final BottomNavButton _bottomNaveButton = BottomNavButton();

  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:const Color(0xffdddcdf),
      body: Column(
      children: [
      Card(
        elevation: 10.0,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: SizedBox(
      width: 370,
      height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const Row(
              children: [
               Padding(padding:
                EdgeInsets.all(15),
                child: Row(
                  children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800
                  ),
                ),
                 SizedBox(width: 140),
              CircleAvatar(
                radius: 30,
              backgroundImage: AssetImage(
                 'assets/avatar.jpg',
                ),
              )
                  ]
                ), 
            ),
              ],
            ) ,
            SizedBox(
              height: 250,
              width: 200,
            child:  Padding(
              padding:const EdgeInsets.all(20),
          child: pieChart.buildPieChart(),
             )
             )
          ],
        ),
      ),
      ),
     const SizedBox(height: 15,),
     Center(
      child: Padding(padding:const EdgeInsets.all(20),
      child: taskCard.taskCard(
     icon: 
     const Icon(
      Icons.folder_copy_outlined,
      color: Colors.black,
      size: 25,
     ),
     title:'Total Task',
    total: 40,
      onTap: (){

      }
      ) ,
      ),
     )
      ]
      ),
       bottomNavigationBar: bottomNave.bottomNave(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bottomNaveButton.showBottomSheet(context); 
        },
        backgroundColor:const Color.fromARGB(255, 240, 51, 3), 
        foregroundColor: Colors.white, 
        elevation: 6.0, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), 
        ),
       child:const Icon(  
          Icons.add_circle_outline_rounded),
      ),
    );
  }
}