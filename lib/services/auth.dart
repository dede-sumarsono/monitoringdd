
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/services/dio.dart';

import '../models/user.dart';

class Auth extends ChangeNotifier{

  bool _isLoggedIn = false;
  late User? _user;
  late String? _token;

  bool get authenticated => _isLoggedIn;
  User? get user => _user;

  final storage = new FlutterSecureStorage();

  void register ({required Map creds}) async {
    print(creds);

    try{
      Dio.Response response = await dio().post('/register',data: creds);
      print(response.data['message'].toString());

      String toast = response.data['message'.toString()];
      Fluttertoast.showToast(
          msg: toast,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );


    } catch(e){
      print(e);
    }
    notifyListeners();
  }

  void login ({required Map creds}) async {
    print(creds);

    try{
      Dio.Response response = await dio().post('/login',data: creds);
      print(response.data.toString());

      String token = response.data.toString();
      this.getToken(token: token);

      String toast = 'Login Berhasil';
      Fluttertoast.showToast(
          msg: toast,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      _isLoggedIn = true;
    } catch(e){
      print(e);

    }
    notifyListeners();
  }



  void logout() async {

    try{
      Dio.Response response = await dio().get('/logout',
      options: Dio.Options(headers: {'Authorization' : 'Bearer $_token'}));

      cleanUp();
      notifyListeners();
    }catch (e){
      print(e);
    }

  }

  void cleanUp() async {
    this._user = null;
    this._isLoggedIn = false;
    this._token = null;
    await storage.delete(key: 'token');
  }

  void getToken({String? token}) async {
    if(token == null){
      return;
    }else{
      try{
        Dio.Response response = await dio().get('/me',
            options: Dio.Options(headers: {'Authorization' : 'Bearer $token'}));
        this._isLoggedIn = true;
        this._user = User.fromJson(response.data);
        this._token = token;
        this.storeToken(token: token);


        notifyListeners();
        print(_user);
      }
      catch(e){
        print(e);
      }

    }
  }

  void storeToken({required String token}) async {

    this.storage.write(key: 'token', value: token);
  }

  void getalluser () async {
    print(_token.toString());
    print(_token.toString());
    try{
      Dio.Response response = await dio().get('/getalluser',options: Dio.Options(headers: {'Authorization' : 'Bearer $_token'}));
      print(response.data.toString());


    } catch(e){
      print(e);
    }
    notifyListeners();

  }



}