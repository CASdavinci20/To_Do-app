import 'package:flutter/material.dart';

class DashboardBuilder{

  Widget taskCard({

    required Icon icon,
    required String title,
    required int total,
    required VoidCallback onTap,
  } ) 
  {

    return GestureDetector(
      onTap: onTap,
      child:Card(
         elevation: 10.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
    ),
    child: SizedBox(
      height: 60,
      width: 400,
      child: Row(
        children: [
          Padding(padding:
         const EdgeInsets.all(10),
          child: Row(
            children: [
           Container(
               height: 50,
               width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(7), 
            ),
            child: icon,
              ),
          const SizedBox(width: 20,),
          Text(
            title,
            style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700
            ),
          ),
           const SizedBox(width:120,),
           Text(
            '$total',
            style:const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
           )
            ]
          )
          )
        ],
      ),
    ),
      ),  
    );

  }
}