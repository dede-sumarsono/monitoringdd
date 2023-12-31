
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoringdd/admin_page/home_admin.dart';
import 'package:monitoringdd/screens/home_screen.dart';
import 'package:monitoringdd/screens/home_screen_navbar.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/utils/color.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/dio.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final storage = new FlutterSecureStorage();
  String? _token;
  var admusr;


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

    new Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_token ==null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => LoginScreen()));
      }else{

      }
      if (!mounted) {
        timer.cancel();
      } else {
        /*setState(() {

        });*/
      }
      timer.cancel();
    });


    /*Timer(const Duration(milliseconds: 4000),(){


      if (_token ==null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => LoginScreen()));
      }else{

      }
    });*/






  }
  masuk(int level){
    if (level==1){
      Route route = MaterialPageRoute(builder: (context) => HomeAdmin());
      Navigator.pushReplacement(context, route);
    }else if(level==2){
      Route route = MaterialPageRoute(builder: (context) => HomeScreenNavBar());
      Navigator.pushReplacement(context, route);

    }
  }


  @override
  Widget build(BuildContext context) {

    final userdata = Provider.of<Auth>(context);

    new Timer.periodic(Duration(seconds: 3), (Timer timer) {
      masuk(userdata.user!.level);
      if (!mounted) {

        timer.cancel();
      } else {
        /*setState(() {

        });*/
      }
      timer.cancel();
    });

    /*Timer(const Duration(milliseconds: 3000),(){
      masuk(userdata.user!.level);

    });*/

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
