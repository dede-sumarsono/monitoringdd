
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoringdd/screens/home_screen.dart';
import 'package:monitoringdd/screens/home_screen_navbar.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/utils/color.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final storage = new FlutterSecureStorage();
  String? _token;


  void readToken() async {

    String? token = await storage.read(key: 'token');
    Provider.of<Auth>(context,listen: false)
        .getToken(token: token);
    _token = token;
    print(token);
  }

  @override
  void initState() {
    super.initState();
    readToken();
    Timer(const Duration(milliseconds: 4000),(){

      //Navigator.push(context, MaterialPageRoute(builder: (contex)=>HomeScreen()));

      if (_token ==null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => LoginScreen()));
      }else{
        //Route route = MaterialPageRoute(builder: (context) => HomeScreen());
        Route route = MaterialPageRoute(builder: (context) => HomeScreenNavBar());
        Navigator.pushReplacement(context, route);
      }
    });




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ orangeColor, orangeLightColor],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        child: Center(
            child: Image.asset("assets/img/notary.png")),
      ),
    );
  }
}
