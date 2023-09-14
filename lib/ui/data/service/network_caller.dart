import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager_project/app.dart';
import 'package:task_manager_project/ui/data/modiuls/auth_utility.dart';
import 'package:task_manager_project/ui/data/modiuls/network_response.dart';
import 'package:task_manager_project/ui/data/utils/urls.dart';
import 'package:task_manager_project/ui/screens/login_screen.dart';

class NetworkCaller {
  Future<NetworkResponse> getResponse(String url) async {
    try {
      log(url);
      Response response = await get(Uri.parse(url),headers: {'Content-type':'application/json','token':AuthUtility.userInfo.token.toString()});

      print(url);

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      }

      else if(response.statusCode==401){
        goToLogin();
      }

      else {
        //todo handel other response 400,401,500
        NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {}
    return NetworkResponse(false, -1, null);
  }

     //Post Methode

  Future<NetworkResponse> postResponse(String url,Map<String,dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url),headers: {'Content-type':'application/json','token':AuthUtility.userInfo.token.toString()},
      body: jsonEncode(body),);

      print(url);

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        //todo handel other response 400,401,500
        NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {}
    return NetworkResponse(false, -1, null);
  }
      void goToLogin(){
    Navigator.pushAndRemoveUntil(TaskManagerApp.globalKey.currentState!.context, MaterialPageRoute(builder: (context)=>LoginScreen() ), (route) => false);
     AuthUtility.clearUserInfo();
      }


}
