import 'package:flutter/material.dart';
import 'package:need_to_do/models/createCategories.dart';
import 'package:need_to_do/sharedpref/savetosharedprefs.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreateCategoryCard {
   final CreateTags tags = CreateTags();
   final TextEditingController _categoryController = TextEditingController();
   final TextEditingController _colorController = TextEditingController();
   final SaveToSharedPref savedData = SaveToSharedPref();
  Widget  createCategoryCard(context){

  return Card(
     elevation: 10.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
    ),
  child: SizedBox(
    height: 600,
    width: 380,
    child: Column(
      children: [
        Padding(padding:const EdgeInsets.fromLTRB(20, 100,20,0),
        child: Column(
          children: [
            SizedBox(
          height: 40,
          width: 300,
          child: TextField(
            controller: _categoryController,
            decoration:  InputDecoration(
              labelText: 'Category Name',
              labelStyle:const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 16),
            ),
          ),
        ),
     SizedBox(height: 20,),
        SizedBox(
          height: 40,
          width: 300,
          child: TextField(
            controller: _colorController,
            decoration:  InputDecoration(
              labelText: 'Color',
              labelStyle:const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 16),
            ),
          ),
        ),
       const SizedBox(height: 60,),
        ElevatedButton(
          onPressed: () async {

         if (_categoryController.text.isNotEmpty) {
           SharedPreferences pref = await  SharedPreferences.getInstance();

                         String? userId  = pref.getString('_id');
                        String name = _categoryController.text;
                        String color = _colorController.text; 

                        tags.createCategory(
                          userId!, 
                          name, 
                          color
                          ).then((result) {

                          if (result != null) {

                            ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(
                                content: Text('Category created successfully'),
                                duration: Duration(seconds: 2),
                              ),
                            );

                          } else {
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                            const  SnackBar(
                                content: Text('Failed to create category'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                            content: Text('Please enter category name'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
          style: ElevatedButton.styleFrom(
            backgroundColor:const Color.fromARGB(255, 48, 38, 122),
            padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 130),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          child:const Text(
            'Done',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white
            ),
          )
          )
          ]
        )
        )
      ],
    ),
  ),
  );
  }
}