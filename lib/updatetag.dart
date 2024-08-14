
import 'package:flutter/material.dart';
import 'package:need_to_do/class/category.dart';
import 'package:need_to_do/models/getcategories.dart';
import 'package:need_to_do/models/updatetags.dart';


class UpdateTagsPage extends StatefulWidget {
  final CategoryClass tags;

  const UpdateTagsPage({Key? key, required this.tags}) : super(key: key);

  @override
  _UpdateTagsPageState createState() => _UpdateTagsPageState();
}


class _UpdateTagsPageState extends State<UpdateTagsPage>{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
 

     final UpdateTags updateTags =UpdateTags();
     final GetAllCatgories tasks = GetAllCatgories();
     String? selectTaskId;
     

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.tags.name;
    _colorController.text = widget.tags.color.toString();
  }


  @override
   void dispose (){
    _nameController.dispose();
    _colorController.dispose();
    super.dispose();
  }


  Future<void> _updateTagAction() async {
  try {
    final updatedTags = await updateTags.updateTags(
     id:widget.tags.tagId,
     name: widget.tags.name,
     color: widget.tags.color.toString()
    );

    if (updatedTags != null) {
      Navigator.pop(
        context,true
      
        );
    
    } else {
      print('Unexpected response format or failed to update task');
    }
  } catch (e) {

    print('Failed to update task: $e');
  }
}


  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      backgroundColor:const Color.fromARGB(255, 48, 38, 122),
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.transparent,
        title:  Row(
          children: [
            IconButton(
            icon:const Icon( Icons.arrow_back_ios,
              color: Colors.white,
            ),
          onPressed: () {
            Navigator.pop(context);
          },
            ),
          const  SizedBox(width: 20,),
        const Text(
          'Edit Task',
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ) ,
        ),
          ]
      ),
      
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
     child:  Card(
     elevation: 10.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
    ),
  child: SizedBox(
    height: 600,
    width: 370,
    child: Column(
      children: [
        Padding(padding:const EdgeInsets.fromLTRB(20, 40,20,0),
        child: Column(
          children: [
        SizedBox(
          height: 45,
          width: 300,
          child: TextField(
            controller: _nameController,
            style:const TextStyle(
            height: 1,
            fontSize: 13,
          ),
            decoration:  InputDecoration(
              labelText: 'Tag Name',
              labelStyle:const TextStyle(
                fontSize: 13,
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
        const SizedBox(height: 30,),

        const SizedBox(height: 30,),
        SizedBox(
          height: 45,
          width: 300,
          child: TextField(
            controller: _colorController,
            style:const TextStyle(
            height: 1,
            fontSize: 13,
          ),
            decoration:  InputDecoration(
              labelText: 'color',
              labelStyle:const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              hintStyle:const TextStyle(fontSize: 13),
            ),
           
          ),
        ),
       const SizedBox(height: 40,),
     
      const SizedBox(height: 50,),
        ElevatedButton(
                      onPressed: () async {
                        _updateTagAction(); 
                       
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
  ),
      ),
      
      bottomNavigationBar:const BottomAppBar(
        height: 40,
        color: Colors.white,
      ),
    );
  }
}
