import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends ChangeNotifier {
  Future<String> getUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('username') ?? '';
  }

  Future<String> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('email') ?? '';
  }

  Future<int> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('userId') ?? -1;
  }

  void saveUserData(String username, String email, int userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email);
    preferences.setString('username', username);
    preferences.setInt('userId', userId);
  }

  void removeUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', '');
    preferences.setString('username', '');
    preferences.setInt('userId', -1);
  }
}
