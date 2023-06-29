
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:monitoringdd/services/dio.dart';

import '../models/user.dart';

class Auth extends ChangeNotifier{

  bool _isLoggedIn = false;
  late User _user;
  late String _token;

  bool get authenticated => _isLoggedIn;
  User get user => _user;


  void login ({required Map creds}) async {
    print(creds);

    try{
      Dio.Response response = await dio().post('/login',data: creds);
      print(response.data.toString());

      String token = response.data.toString();
      this.getToken(token: token);

      _isLoggedIn = true;
    } catch(e){
      print(e);
    }



    notifyListeners();
  }

  void logout(){
    _isLoggedIn = false;

    notifyListeners();
  }

  void getToken({String? token}){
    if(token == null){
      return;
    }else{
      try{

      }
      catch(e){
        print(e);
      }

    }
  }
}