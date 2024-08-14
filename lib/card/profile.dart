import 'package:flutter/material.dart';


class ProfileCard {
  Widget profileCard({
    required String fname,
    required String lname,
    required String phone,
    required String email,
    required String adress,
    required Image  profilepic
  }){

    return  Card(
       elevation: 10.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
    ),
      child: Center(
        child: SizedBox(
          height: 600,
          width: 370,
        child: Column(
          children: [
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 70,horizontal: 20),
             child: Column(
              children:<Widget> [
                CircleAvatar(
                  radius: 50,
             backgroundImage:profilepic.image,
                ),
                 const SizedBox(height: 30,),
                const  Divider(
                    color: Color.fromARGB(255, 48, 38, 122),
                    height: 2,
                  ),
                  const SizedBox(height: 20,),
                   _buildInfoRow(0,'First Name:', fname),
            _buildInfoRow(1,'Last Name:', lname),
            _buildInfoRow(2,'Email:', email),
             _buildInfoRow(3,'Address:', adress),
            _buildInfoRow(4,'Phone:', phone),
              ],
             ),
              )
          ],
        ),

        ),
      )
    );

  }

static Widget _buildInfoRow(int index, String label, String value) {
    return Container(
      color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color.fromARGB(255, 48, 38, 122),
              ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child:  Text(
              value,
              style:const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16
              ),
              softWrap: true,
          )
          ),
        ],
      ),
    );
  }
}