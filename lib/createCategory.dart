import 'package:flutter/material.dart';
import 'package:need_to_do/card/createcategory.dart';



class CreateCategory extends StatefulWidget{
  const CreateCategory({super.key});

  @override
  CreateCategoryState  createState() => CreateCategoryState();
}

class CreateCategoryState extends State<CreateCategory>{
   final CreateCategoryCard  createCategory = CreateCategoryCard();
  

   @override
   Widget build(BuildContext context){ 
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 48, 38, 122),
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
            onPressed: () {
          Navigator.pop(context);


            },
            ),
           const SizedBox(width: 30,),
           const Text(
              'Create Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white
              ),
            ),

          ],
        )
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.fromLTRB(0, 100, 0, 0),
     child:createCategory.createCategoryCard(context)  
      ),
      ),
      bottomNavigationBar:const BottomAppBar(
        height: 40,
        color: Colors.white,
      ),
    );
  }
}