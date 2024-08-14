import 'package:flutter/material.dart';
import 'dart:async';
import 'package:need_to_do/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Need To Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:const SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
    const  Duration(seconds: 3), 
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding:const EdgeInsets.symmetric(vertical: 250,horizontal: 20),
            child: Column(
              children: [
        ClipRRect(
           borderRadius: BorderRadius.circular(30),
            child:  Image.asset(
            'assets/startLogo.jpg',
            fit: BoxFit.cover ,
              height: 150,
            width: 150, 
          ),
     ),
    const SizedBox(height: 5,),
   const Text(
      'NeedtoDo...',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 18, 6, 91)
      ),
    )
              ]
            )
            )
          ]
        )
      ),
    );
  }
}
