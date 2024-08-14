import 'package:flutter/material.dart';

class CategoryCard{
  Widget categoryCard({
    required Icon icon,
    required String title,
    required int total,
    required VoidCallback onTap
  }){
    return GestureDetector(
      onTap:onTap ,
   child:  Card(
      elevation: 10.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
    ),
    child: SizedBox(
          height: 150,
          width: 150,
          child: Column(
            children: [
              Padding(
                padding:const EdgeInsets.all(10),
             child: Column(
              children: [
                           Container(
               height: 50,
               width: 50,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(7), 
            ),
            child:  icon,
                           ),
             const SizedBox(height: 6,),
              Text(
                title,
                style:const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black
                ),
              ),
              const SizedBox(height: 7,),
              Text(
                '$total',
                style:const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
              ),
              ]
             )
              )
            ],
          ),
    ),
    )
    );
  }


  Widget categoryDisplayCard({
    required String name,
    required Color color
  }){

    return  Card(
      elevation: 10.0,
          color: color,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          ),
      child: SizedBox(
         width: 80,
        height: 40,
        child: Center(
       child: Text(
          name,
          style:const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      ),
      )
          );
  }
}

