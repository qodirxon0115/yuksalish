
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuksalish_1/model/user_model.dart';

class Prefs{

  // User Related
  static storeUser(User user)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    prefs.setString("user", stringUser);
  }

  static loadUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic stringUser = prefs.getString("user");
    if(stringUser == null || stringUser.isEmpty){
      return null;
    }
    Map <String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }


}