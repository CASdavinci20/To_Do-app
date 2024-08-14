import 'package:flutter/material.dart';
import 'package:need_to_do/card/profile.dart';
import 'package:need_to_do/dropdown/profile.dart';


class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});
  @override
  ProfilePageState createState()=> ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{
  final ProfileCard profileCard = ProfileCard();

  @override
  Widget build(BuildContext context){
    return Scaffold(
     backgroundColor:const  Color.fromARGB(255, 48, 38, 122),
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
           icon:const  Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25,
            ),
            onPressed: (){
          Navigator.pop(context);
            },
            ),
          const SizedBox(width: 50,),
       const Text(
          'Profile Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
          ]
      ),
       actions: <Widget>[
          ProfileDropdown.proilePagePopmenu(context), 
        ],
      ),
            body: SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.fromLTRB(0, 50, 0, 0),
     child:profileCard.profileCard(
      fname: 'John',
      lname: 'Omar',
      email: 'omar@gmail.com',
      adress: 'wuse 2 oppsite stone and sticks',
      profilepic: Image.asset(
        'assets/avatar.jpg',
        height: 100,
        width: 100,
      ),
      phone: '0816930300'
     )  
      ),
      ),
      bottomNavigationBar:const BottomAppBar(
        height: 40,
        color: Colors.white,
      ),
    );
  }
}