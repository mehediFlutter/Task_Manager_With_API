import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_project/ui/data/modiuls/login_model.dart';

class AuthUtility {
  AuthUtility._();
  static LoginModel userInfo = LoginModel();

  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences _sharePrefs = await SharedPreferences.getInstance();
    await _sharePrefs.setString('user-data', jsonEncode(model.toJson()));
    userInfo=model;
  }

  static Future<LoginModel> gateUserInfo() async {
    SharedPreferences _sharePrefs = await SharedPreferences.getInstance();
    String value = _sharePrefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences _sharePrefs = await SharedPreferences.getInstance();
    await _sharePrefs.clear();
  }

 static Future<bool> checkIfUserLoggedIn() async {
    SharedPreferences _sharePrefs = await SharedPreferences.getInstance();
    bool isLogin = _sharePrefs.containsKey('user-data');
    if(isLogin){
    userInfo=  await gateUserInfo();
    }
    return isLogin;


  }
}
