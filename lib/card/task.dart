import 'package:flutter/material.dart';


class TaskCard{
  Widget taskCard({
    required String mode,
    required String title,
    required String description,
    required Widget  titleIcon,
    required Icon timeIcon,
    required Icon  persoIcon,
    // required TimeOfDay time,
    required  int  people,
    required   Color color,
    required VoidCallback onTap

  }){
    return Card(
      elevation: 8.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
    ),
    child: SizedBox(
      child: Column(
        children: [
          Padding(padding:const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mode,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
             const Divider(height: 1, color: Colors.grey),
             GestureDetector(
              onTap: onTap ,
        child:   Container(
  height: 70,
  color: Colors.grey[200],
  child: Stack(
    children: [
      Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        width: 6,
        child: Container(
          color: Colors.orange,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                SizedBox(
                  width: 193,
               child:  Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                )
              ],
            ),
            titleIcon,
          ],
        ),
      ),
    ],
  ),
)
             ),
            const SizedBox(height: 10,),
             Row(
              children: [
                Row(
                  children: [
                    timeIcon,
                    // Text(
                    //   '$time',
                    //   style:const TextStyle(
                    //     fontSize: 13,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.black
                    //   ),
                    // )
                  ],
                ),
              const  SizedBox(width: 20,),
                Row(
                  children: [
                    persoIcon,
                    Text(
                      '$people persons',
                      style:const  TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
             )
             
            ],
          ),
          ),
        ],
      ),
    ),
    );
  }
}


