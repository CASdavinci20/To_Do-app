import 'package:flutter/material.dart';
import 'package:need_to_do/login.dart';
import 'package:need_to_do/models/api.dart';

class SingupPage extends StatefulWidget{
  const SingupPage({super.key});
  
  @override
  SingupPageState createState() => SingupPageState();
  
}


class SingupPageState extends State<SingupPage>{
  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  // final _phoneRegex = RegExp(r'^[0-9]{10,13}$');
  final _formKey = GlobalKey<FormState>();
  final _passwordRegex = RegExp(r'^\d{8}$');  
  final PostUser postCall = PostUser();


 
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xfff4f4f4),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.fromLTRB(35, 150, 35, 10),
          child: Form(
           key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Divider(height: 4, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Registration Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color:Color.fromARGB(255, 48, 38, 122),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(height: 4, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                  SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    controller: fnameController,
                    style:const TextStyle(
                      height: 1,
                      fontSize: 13,
                    ),
                    decoration:  InputDecoration(
                      labelText: 'First Name',
                      labelStyle:const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintStyle:const TextStyle(fontSize: 16),
                    ),
                    validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                    }
                  ),
                ),
                const SizedBox(height: 20),
                  SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    controller: lnameController,
                    style:const TextStyle(
                    height: 1,
                    fontSize: 13,
                  ),
                     decoration:  InputDecoration(
                      labelText: 'Last Name',
                      labelStyle:const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintStyle:const TextStyle(fontSize: 16),
                    ),
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                         }
                      return null;
                    }
                  ),
                ),
                const SizedBox(height: 20),
                  SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    controller: emailController,
                    style:const TextStyle(
                    height: 1,
                    fontSize: 13,
                  ),
                    decoration:  InputDecoration(
                      labelText: 'Email',
                      labelStyle:const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintStyle:const TextStyle(fontSize: 16),
                    ),
                    validator: (value) {
                       if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                           }else if (!_emailRegex.hasMatch(value)) {
                              return 'Enter a valid email addrress';
                           }
                      return null;
                    }
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    controller: passwordController,
                    style:const TextStyle(
                      height: 1,
                      fontSize: 13,
                    ),
                      decoration:  InputDecoration(
                      labelText: 'Password',
                      labelStyle:const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintStyle:const TextStyle(fontSize: 16),
                    ),
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'This field cannot be empty';
                          }else if (!_passwordRegex.hasMatch(value)) {
                              return 'your password mos be aleast eight numbers';
                           }
                          else {
                        return null;
                          }
                    }
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: ()async {      
                    if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                'processing data wait a moment',
                             )
                              )
                           );
                           try{

                     await  postCall.insertUser(
                          fnameController.text,
                          lnameController.text,
                          emailController.text,
                          passwordController.text
                           );
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registration successful!'),
                          ),
                        );
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const LoginPage(),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registration failed: $e'),
                          ),
                        );

                      }
                    }
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(255, 48, 38, 122),
                    padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




