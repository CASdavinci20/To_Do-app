import 'package:shared_preferences/shared_preferences.dart';


class SaveToSharedPref {
  
Future<void> saveLoginDetailsToSharedPreferences(String email, String password, String userId,) async {
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  prefs.setString('password', password);
   prefs.setString('_id', userId);

   retrieveLoginDetailsFromSharedPreferences();


}


  Future<void> saveUser(String userId)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('_id', userId);
}

   
Future<void> retrieveLoginDetailsFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');
  String? userId = prefs.getString('_id');

  print('email: $email' 'password: $password' 'id: $userId');
  
}
}