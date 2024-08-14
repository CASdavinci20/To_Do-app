import 'package:flutter/material.dart';
import 'package:need_to_do/landingPage.dart';
import 'package:need_to_do/sharedpref/savetosharedprefs.dart';
import 'signup.dart';
import 'package:need_to_do/userauthentication/authenticateuser.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  LoginState createState() => LoginState();
  
}


class LoginState extends State<LoginPage>{
  final Authenthicate authenticateUser = Authenthicate();
  final SaveToSharedPref savedData = SaveToSharedPref();
  final _formKey = GlobalKey<FormState>();
  

  
  final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

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
          padding:const EdgeInsets.fromLTRB(30, 200, 30, 10),
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
                      'Login Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Agbalumo',
                        color: Color.fromARGB(255, 48, 38, 122),
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
                    controller: _emailController,
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
                    return 'Please enter your Email';
                  }
                  return null; 
                },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    controller: _passwordController,
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
                    return 'Please enter your Email';
                  }
                  return null; 
                },
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      'You don’t have an account ?',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const SingupPage(),
                          ),
                     ); 
                      },
                      child: const Text(
                        'register here',
                        style: TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
        onPressed: () async {
        
  if (_formKey.currentState!.validate()) {
    try{
      var authenticated = await authenticateUser.authenticateUsers(
        _emailController.text,
        _passwordController.text
      );
      if (authenticated != null) {
        String userId = authenticated;
         savedData.saveLoginDetailsToSharedPreferences(
          _emailController.text,
          _passwordController.text,
          userId
        );       
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoardPage(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Invalid Credentials',
                style: TextStyle(color: Colors.red),
              ),
              content: const Text('Invalid email or password. Please try again.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
        } catch (e) {
      print('Error: $e');
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
                    'Login',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
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




